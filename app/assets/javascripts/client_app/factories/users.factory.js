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
            },
            all: function(options){
                return $http.get(I18n.locale +   '/users?q=' + options.query + '&page=' + options.page);
            },
            friends: function(options){
                return $http.get(I18n.locale +   '/users/friends?q=' + options.query + '&page=' + options.page);
            },
            requested_friends: function(options){
                return $http.get(I18n.locale +   '/users/requested_friends?q=' + options.query + '&page=' + options.page);
            },
            pending_friends: function(options){
                return $http.get(I18n.locale +   '/users/pending_friends?q=' + options.query + '&page=' + options.page);
            }
        };
    }])
}());