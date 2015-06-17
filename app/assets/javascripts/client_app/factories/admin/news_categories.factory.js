(function () {
    'use strict';
    angular.module('petModeAdminApp').factory('CategoriesFactory', ['$http', function($http){
        return {
            upsert: function(category){
                if(category.id){
                    return $http.put('/admin/categories/' + category.id, category);
                }else{
                    return $http.post('/admin/categories', category);
                }
            },
            show: function(id){
                return $http.get('/admin/categories/' + id + '.json')
            },
            all: function(params){
                return $http.get('/admin/categories.json?page=' + params.page);
            },
            destroy: function(id){
                return $http.delete('/admin/categories/' + id)
            }
        };
    }])
}());