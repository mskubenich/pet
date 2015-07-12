(function () {
    'use strict';
    angular.module('petModeApp').factory('OrderFactory', ['$http', function($http){
        return {
            create: function(options){
                return $http.post('/order.json', { order: options });
            }
        }
        ;
    }])
}());