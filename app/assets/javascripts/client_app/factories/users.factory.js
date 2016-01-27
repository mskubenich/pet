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
            updateProfile: function(user, avatar){
                var fd = new FormData();
                fd.append('user[first_name]', user.first_name);
                fd.append('user[last_name]', user.last_name);
                fd.append('user[login]', user.login);
                fd.append('user[user_profession]', user.user_profession);
                fd.append('user[specialist_type]', user.specialist_type);
                fd.append('user[phone]', user.phone);
                fd.append('user[country_id]', user.country_id);
                fd.append('user[city]', user.city);
                if(avatar){
                    fd.append('user[avatar]', avatar);
                }

                return $http.put('/users/update_profile', fd, {
                    transformRequest: angular.identity,
                    headers: {'Content-Type': undefined}
                });
            },
            my_info: function(){
                return $http.get('/users/my_info');
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
            },
            show: function(id){
                return $http.get(I18n.locale + '/users/' + id + '.json');
            },
            friends_preview: function(){
                return $http.get(I18n.locale + '/users/friends_preview.json')
            },
            become_specialist: function(specialist){
                return $http.post(I18n.locale + '/users/become_specialist.json', {
                    specialist: {
                        profession: specialist.profession
                    }
                })
            }
        };
    }])
}());