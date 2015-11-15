"use strict";

(function () {
    angular.module('vc3app')
    .controller('SeriesController', function ($scope, SeriesService, $q, $location, config) {
        $scope.serie = {};
        $scope.seriesID = parseInt(getParameterByName('id'));
        $q.all([SeriesService.GetSeries($scope.seriesID)]).then(function (response) {
            $scope.serie = response[0].series;
            $scope.sermons = response[0].sermons;
        });
        $scope.BindSeriesDetails = function () {
            $scope.seriesDescription = $scope.serie.About;
        }
        $scope.GetSermonURL = function (id) {
            return config.sermonURL + id;
        }
    })
})(angular)