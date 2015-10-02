"use strict";
var app = angular.module('vc3app', ['ngMaterial', 'firebase'])
    .config(function ($mdIconProvider) {
        $mdIconProvider
        .defaultIconSet('../../icons/icon.svg')
        .iconSet('social', '../../icons/social.svg')
        .iconSet('hardware', '../../icons/hardware.svg')
        .iconSet('comm', '../../icons/communication.svg')
        .iconSet('action', '../../icons/action.svg')
        .iconSet('navigation', '../../icons/navigation.svg', 24)
    })
.controller('AppCtrl', function ($scope, $http, $filter) {
    $http.post('../vc3siteservice.asmx/GetSpeakers', {}).success(function (data) {
        $scope.speakers = JSON.parse(data.d);
    })
    $http.post('../vc3siteservice.asmx/GetSeries', {}).success(function (data) {
        $scope.series = JSON.parse(data.d);
    })
    $scope.srm = {}
    $scope.srm.place = '';
    $scope.srm.series = 0;
    $scope.srm.image = '';
    $scope.srm.video = '';
    $scope.AddSermon = function () {
        var data = {
            title: $scope.srm.name,
            descr: $scope.srm.desc,
            by: $scope.srm.by,
            seriesID: $scope.srm.series,
            sermonPlace: $scope.srm.place,
            sermonDate: $filter('date')($scope.srm.date, 'longDate'),
            audioLink: $scope.srm.audio,
            imageLink: $scope.srm.image,
            videoLink: $scope.srm.video,
            artLink: $scope.srm.art,
            artSmallLink: $scope.srm.art_sml
        }
        $http.post('../vc3siteservice.asmx/AddSermon', data).success(function (data) {
            console.log(data);
        });
    }
});
app.controller('SermonController', function ($scope, data, $sce, $window, urls) {
    $scope.series = data.series;
    $scope.sermons = data.sermons;
    $scope.serie = {};
    $scope.sermon = {};
    $scope.GetSermonURL = function (id) {
        return urls.sermonURL + id;
    }
    $scope.SetCurrentSeries = function () {
        //Get the seriesid from query strings
        //Match the seriesid in the seriescollection
        //Set the series details to the $scope.serie variable
        var seriesID = 2;
        for (var i = 0; i < $scope.series.length; i++) {
            if ($scope.series[i].SERIESID === seriesID) {
                $scope.serie = $scope.series[i];
                $scope.seriesDescription = $sce.trustAsHtml($scope.serie.SERIESDESCRIPTION);
                return;
            }
        }
    }
    $scope.SetCurrentSermon = function () {
        //Get the sermonid from query strings
        //Match the sermonid in the sermonsCollection
        //Set the sermon details to the $scope.sermon variable
        var sermonID = $scope.sermons.sort(comp)[0].SERMONID;
        for (var i = 0; i < $scope.sermons.length; i++) {
            if ($scope.sermons[i].SERMONID === sermonID) {
                $scope.sermon = $scope.sermons[i];
                $scope.sermonDescription = $sce.trustAsHtml($scope.sermon.SERMONDESCRIPTION);
                return;
            }
        }
    }
    $scope.series.$loaded(function () {
        $scope.SetCurrentSeries();
    })
    $scope.sermons.$loaded(function () {
        $scope.SetCurrentSermon();
    })
})
app.service('data', function ($firebaseArray, $firebaseObject, $q, urls) {
    let thiss = this;
    this.series = {};
    this.GetSeries = function () {
        var q = $q.defer();
        if (!thiss.series.length) {
            var srsObj = new Firebase(urls.fire_SeriesURL);
            var series = $firebaseArray(srsObj);
            series.$loaded(function (res) { thiss.series = res; q.resolve(thiss.series); })
        } else {
            q.resolve(thiss.series);
        }
        return q.promise;
    }
    this.sermons = {};
    this.GetSermons = function () {
        var q = $q.defer();
        if (!thiss.series.length) {
            var srsObj = new Firebase(urls.fire_SermonsURL);
            var sermons = $firebaseArray(srsObj);
            sermons.$loaded(function (res) { thiss.sermons = res; q.resolve(thiss.sermons); })
        } else {
            q.resolve(thiss.sermons);
        }
        return q.promise;
    }
    this.speakers = {};
    this.GetSpeakers = function () {
        var q = $q.defer();
        if (!thiss.speakers.length) {
            var srsObj = new Firebase(urls.fire_SpeakersURL);
            var speakers = $firebaseArray(srsObj);
            speakers.$loaded(function (res) { thiss.speakers = res; q.resolve(thiss.speakers); })
        } else {
            q.resolve(thiss.speakers);
        }
        return q.promise;
    }
    this.Add = function (name, sermon) {
        var deferred = $q.defer();
        var srsObj = new Firebase(urls.fire_SermonsURL);
        var sermons = $firebaseArray(srsObj);
        console.log('trig');
        sermons.$add(sermon).then(function (ref) {
            var id = ref.key();
            deferred.resolve(id);
        })
        return deferred.promise;
    }
    this.Edit = function (name, newsermon, id) {
        var deferred = $q.defer();
        var srs = new Firebase(urls.fire_SermonsURL + "/" + id);
        var sermon = $firebaseObject(srs);
        sermon = CopyObject(newsermon, sermon);
        sermon.$save().then(function (res) {
            deferred.resolve(res);
        })
        return deferred.promise;
    }
    var CopyObject = function (oldObj, newObj) {
        var keys = Object.keys(oldObj);
        for (var i = 0 ; i < keys.length; i++) {
            var key = keys[i];
            newObj[key] = oldObj[key];
        }
        return newObj;
    }
});
app.service('urls', function ($window) {
    this.sermonURL = 'http://' + $window.location.host + '/Presentation/Sermons?sermonid=';
    this.seriesURL = 'http://' + $window.location.host + '/Presentation/Series?seriesid=';
    this.fire_SermonsURL = "https://demovc3.firebaseio.com/sermons";
    this.fire_SeriesURL = "https://demovc3.firebaseio.com/series";
    this.fire_SpeakersURL = "https://demovc3.firebaseio.com/speakers";
})