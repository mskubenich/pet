(function () {
    'use strict';
    angular.module('petModeApp').factory('UsersFactory', ['$http', function($http){
        return {
            create: function(user_params) {
                return $http.post('users', {user: user_params});
            }
        };
    }])
}());