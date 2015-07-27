(function () {
    'use strict';
    angular.module('petModeAdminApp').factory('CountriesFactory', ['$http', function($http){
        return {
            all: function(){
                return $http.get('/admin/countries.json');
            }
        };
    }])
}());