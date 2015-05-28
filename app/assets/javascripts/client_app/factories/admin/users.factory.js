(function () {
    'use strict';
    angular.module('petModeAdminApp').factory('UsersFactory', ['$http', function($http){
        return {
            all: function(){
                return $http.get('admin/users.json');
            }
        };
    }])
}());