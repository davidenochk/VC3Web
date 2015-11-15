"use strict";

(function () {
    angular.module('vc3app')
    .controller('AboutController', function ($scope, AboutService, $q, progress) {
        $scope.imageLinks = {};
        progress.inc();
        $q.all([AboutService.GetImages()]).then(function (response) {
            $scope.imageLinks = response[0];
            progress.dec();
        })
    })
})(angular)