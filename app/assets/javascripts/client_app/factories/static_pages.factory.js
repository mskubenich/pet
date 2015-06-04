(function () {
    'use strict';
    angular.module('petModeApp').factory('StaticPagesFactory', ['$http', function($http){
        return {
            show: function(page_name){
                return $http.get('/admin/static_pages/' + page_name)
            }
        };
    }])
}());