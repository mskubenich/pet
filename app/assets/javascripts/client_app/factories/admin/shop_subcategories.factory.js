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

//admin_shop_category_shop_subcategories GET    (/:locale)/admin/shop_categories/:shop_category_id/shop_subcategories(.:format)     admin/shop_subcategories#index {:locale=>/en|ru/}
//POST   (/:locale)/admin/shop_categories/:shop_category_id/shop_subcategories(.:format)     admin/shop_subcategories#create {:locale=>/en|ru/}
//admin_shop_category_shop_subcategory GET    (/:locale)/admin/shop_categories/:shop_category_id/shop_subcategories/:id(.:format) admin/shop_subcategories#show {:locale=>/en|ru/}
//PATCH  (/:locale)/admin/shop_categories/:shop_category_id/shop_subcategories/:id(.:format) admin/shop_subcategories#update {:locale=>/en|ru/}
//PUT    (/:locale)/admin/shop_categories/:shop_category_id/shop_subcategories/:id(.:format) admin/shop_subcategories#update {:locale=>/en|ru/}
//DELETE (/:locale)/admin/shop_categories/:shop_category_id/shop_subcategories/:id(.:format) admin/shop_subcategories#destroy {:locale=>/en|ru/}

