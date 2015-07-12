(function () {
    'use strict';
    angular.module('petModeAdminApp').factory('OrdersFactory', ['$http', function($http){
        return {
            all: function(options){
                return $http.get('admin/orders.json?page=' + options.page);
            },
            remove: function(id){
                return $http.delete('admin/users/' + id + '.json');
            },
            show: function(id){
                return $http.get('admin/users/' + id + '.json');
            }
        };
    }])
}());