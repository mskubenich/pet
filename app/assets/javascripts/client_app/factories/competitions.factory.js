(function () {
    'use strict';
    angular.module('petModeApp').factory('CompetitionsFactory', ['$http', function($http){
        return {
            show: function(competition_id){
                return $http.get('/'+ gon.locale + '/competitions/' + competition_id)
            },
            all: function(params){
                return $http.get('/' + gon.locale + '/competitions.json?page=' + params.page);
            }
        };
    }])
}());