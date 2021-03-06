(function () {
    'use strict';
    angular.module('petModeApp').factory('CartFactory', ['$http', function($http){
        return {
            all: function(options){
                return $http.get('/cart.json');
            },
            add: function(product_id){
                return $http.post('/cart/add', {product_id: product_id})
            },
            destroy: function(item_id){
                return $http.delete('/cart/' + item_id)
            },
            set_count: function(id, count){
                return $http.post('cart/set_count', {cart_item_id: id, count: count});
            }
        }
        ;
    }])
}());