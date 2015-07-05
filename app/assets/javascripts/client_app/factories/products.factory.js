(function () {
    'use strict';
    angular.module('petModeApp').factory('ProductsFactory', ['$http', function($http){
        return {
            all: function(options){
                return $http.get('/products.json?page=' + options.page +
                                            '&family=' + options.query.family +
                                            '&price_min=' + options.query.price.min +
                                            '&price_max=' + options.query.price.max);
            },
            show: function(id){
                return $http.get('/products/' + id + '.json');
            }
        }
        ;
    }])
}());