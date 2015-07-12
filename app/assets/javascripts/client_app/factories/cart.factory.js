(function () {
    'use strict';
    angular.module('petModeApp').factory('CartFactory', ['$http', function($http){
        return {
            all: function(options){
                return $http.get('/cart.json');
            },
            add: function(product_id){
                return $http.post('/cart/add', {product_id: product_id})
            }
        }
        ;
    }])
}());