(function () {
    'use strict';
    angular.module('petModeAdminApp').factory('ShopCategoriesFactory', ['$http', function($http){
        return {
            upsert: function(category){
                if(category.id){
                    return $http.put('/admin/shop_categories/' + category.id, {shop_category: category});
                }else{
                    return $http.post('/admin/shop_categories', {shop_category: category});
                }
            },
            show: function(id){
                return $http.get('/admin/shop_categories/' + id + '.json')
            },
            all: function(params){
                return $http.get('/admin/shop_categories.json?page=' + params.page);
            },
            destroy: function(id){
                return $http.delete('/admin/shop_categories/' + id)
            }
        };
    }])
}());