var app = angular.module('vc3app',[]);
app.controller('archiveController', function ($scope, $http) {
    //call getsermons
    console.log('logged');
    //$http.post('../vc3siteservice.asmx/GetSpeakers', {}).success(function (data) {
    //    $scope.speakers = JSON.parse(data.d);
    //})
    $http.get('../vc3siteservice.asmx/GetSermons').success(function (data) { console.log(data); })
});