(function () {
    'use strict';
    angular.module('petModeApp').factory('ExpertsFactory', ['$http', function($http){
        return {
            show: function(id){
                return $http.get('/'+ gon.locale + '/experts/' + id)
            },
            all: function(params){
                return $http.get('/' + gon.locale + '/experts.json?page=' + params.page);
            }
        };
    }])
}());