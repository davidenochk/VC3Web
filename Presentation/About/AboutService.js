"use strict";
angular.module('vc3app')
.service('AboutService', function ($q, data) {
    let _this = this;
    this.GetImages = function () {
        var q = $q.defer();
        $q.all([data.GetImages()]).then(function (response) {
            q.resolve(response[0]);
        })
        return q.promise;
    }
})