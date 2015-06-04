(function () {
    'use strict';
    angular.module('petModeAdminApp').factory('StaticPagesFactory', ['$http', function($http){
        return {
            update: function(page){
                return $http.put('/admin/static_pages/' + page.name, {page: page});
            },
            show: function(page_name){
                return $http.get('/admin/static_pages/' + page_name)
            }
        };
    }])
}());