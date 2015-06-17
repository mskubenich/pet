(function () {
    'use strict';
    angular.module('petModeApp').factory('UsersFactory', ['$http', function($http){
        return {
            create: function(user_params) {
                return $http.post('users', {user: user_params});
            },
            uploadAvatar: function(file){
                var fd = new FormData();
                fd.append('file', file);
                $http.post('/users/avatar', fd, {
                    transformRequest: angular.identity,
                    headers: {'Content-Type': undefined}
                })
            },
            profile: function(){
                return $http.get('/users/profile');
            }
        };
    }])
}());