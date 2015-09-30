"use strict";
var app = angular.module('vc3app', ['firebase'])
app.controller('SermonController', function ($scope, $firebaseArray) {
    var serObj = new Firebase("https://demovc3.firebaseio.com/sermons");
    $scope.sermons = $firebaseArray(serObj);
})