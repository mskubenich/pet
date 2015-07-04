(function () {
    'use strict';
    angular.module('petModeAdminApp').factory('ShopSubcategoriesFactory', ['$http', function($http){
        return {
            upsert: function(params){
                if(params.subcategory.id){
                    return $http.put('/admin/shop_categories/' + params.category_id + '/shop_subcategories/' + params.subcategory.id, {shop_subcategory: params.subcategory});
                }else{
                    return $http.post('/admin/shop_categories/' + params.category_id + '/shop_subcategories', {shop_subcategory: params.subcategory});
                }
            },
            show: function(category_id, id){
                return $http.get('/admin/shop_categories/' + category_id + '/shop_subcategories/' + id + '.json')
            },
            all: function(params){
                return $http.get('/admin/shop_categories/' + params.shop_category_id + '/shop_subcategories.json?page=' + params.page);
            },
            destroy: function(category_id, id){
                return $http.delete('/admin/shop_categories/' + category_id + '/shop_subcategories/' + id);
            }
        };
    }])
}());