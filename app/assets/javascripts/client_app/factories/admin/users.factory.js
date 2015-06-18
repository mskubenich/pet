(function () {
    'use strict';
    angular.module('petModeAdminApp').factory('UsersFactory', ['$http', function($http){
        return {
            all: function(options){
                return $http.get('admin/users.json?page=' + options.page);
            },
            remove: function(id){
                return $http.delete('admin/users/' + id + '.json');
            }
        };
    }])
}());