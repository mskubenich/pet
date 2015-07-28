(function () {
    'use strict';
    angular.module('petModeApp').factory('CountriesFactory', ['$http', function($http){
        return {
            all: function(){
                return $http.get(I18n.locale + '/countries.json');
            }
        };
    }])
}());