(function () {
    'use strict';
    angular.module('petModeApp').factory('ExhibitionsFactory', ['$http', function($http){
        return {
            show: function(exhibition_id){
                return $http.get('/'+ gon.locale + '/exhibitions/' + exhibition_id)
            },
            all: function(params){
                return $http.get('/' + gon.locale + '/exhibitions.json?page=' + params.page);
            }
        };
    }])
}());