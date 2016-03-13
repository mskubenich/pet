(function () {
    'use strict';
    angular.module('petModeApp').factory('SearchFactory', ['$http', function($http){
        return {
            all: function(options){
                return $http.get(I18n.locale + '/search.json?q=' + options.q + '&page=' + options.page);
            }
        };
    }])
}());