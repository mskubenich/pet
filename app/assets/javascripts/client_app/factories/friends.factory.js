(function () {
    'use strict';
    angular.module('petModeApp').factory('GoodHandsFactory', ['$http', function($http){
        return {
            create: function(id){
                return $http.post('/friendship/' + id + '/create', {});
            }
        };
    }])
}());