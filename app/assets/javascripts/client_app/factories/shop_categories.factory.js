(function () {
    'use strict';
    angular.module('petModeApp').factory('ShopCategoriesFactory', ['$http', function($http){
        return {
            all: function() {
                return $http.get('/shop_categories');
            }
        };
    }])
}());