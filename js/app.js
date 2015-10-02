"use strict";
Array.prototype.find = function (c, v) {
    for (var i = 0; i < this.length; i++) {
        if (this[i][c] === v) {
            return this[i];
        }
    }
    return [];
};
Array.prototype.findAll = function (c, v) {
    var r = [];
    for (var i = 0; i < this.length; i++) {
        if (this[i][c] === v) {
            r.push(this[i]);
        }
    }
    return r;
};
function comp(a, b) {
    return -new Date(a.SERMONDATE).getTime() + new Date(b.SERMONDATE).getTime();
}
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
app.controller('AppCtrl', function ($scope, $http, $filter) {
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
    $scope.GetSermonData = function () {
        var sermons = $scope.sermons;
        //Sort by date
        sermons.sort(comp);
        var result = [];
        //Find for each seriesid other than 0
        for (var i = 0; i < sermons.length; i++) {
            if (sermons[i]['SERIESID'] === 0)
                result.push(sermons[i]);
            else if (result.find('SERIESID', sermons[i]['SERIESID']).length == 0)
                result.push(sermons[i]);
        }
        //console.log(result);
        return result;
    }
    $scope.RedirectToSermon = function (id) {
        $window.location.href = urls.sermonURL + id;
    };
    $scope.GetName = function (ser) {
        if (ser.SERIESID == '0')
            return ser.SERMONNAME;
        else {
            return $scope.series.find('SERIESID', ser.SERIESID).SERIESNAME;
        }
    }
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
            if ($scope.sermons[i].SERMONID === sermonID)
                $scope.sermon = $scope.sermons[i];
        }
    }
    $scope.series.$loaded(function () {
        $scope.SetCurrentSeries();
    })
    $scope.sermons.$loaded(function () {
        $scope.SetCurrentSermon();
    })
})
app.service('data', function ($firebaseArray) {
    var serObj = new Firebase("https://demovc3.firebaseio.com/sermons");
    var srsObj = new Firebase("https://demovc3.firebaseio.com/series");
    var spkObj = new Firebase("https://demovc3.firebaseio.com/speakers");
    this.series = $firebaseArray(srsObj);
    this.sermons = $firebaseArray(serObj);
    this.speakers = $firebaseArray(spkObj);
})
app.service('urls', function ($window) {
    this.sermonURL = 'http://' + $window.location.host + '/Presentation/Sermons?sermonid=';
    this.seriesURL = 'http://' + $window.location.host + '/Presentation/Series?seriesid=';
})