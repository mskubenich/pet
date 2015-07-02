(function () {
    'use strict';
    angular.module('petModeApp').factory('BreedsFactory', ['$http', function($http){
        return {
            all: function(options){
                return $http.get('/breeds.json?family=' + options.family);
            }
        };
    }])
}());