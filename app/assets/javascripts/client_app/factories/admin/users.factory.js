(function () {
    'use strict';
    angular.module('petModeAdminApp').factory('UsersFactory', ['$http', function($http){
        return {
            all: function(options){
                return $http.get('admin/users.json?page=' + options.page);
            },
            remove: function(id){
                return $http.delete('admin/users/' + id + '.json');
            },
            ban: function(id){
                return $http.post('admin/users/' + id + '/ban.json');
            },
            unban: function(id){
                return $http.post('admin/users/' + id + '/unban.json');
            },
            show: function(id){
                return $http.get('admin/users/' + id + '.json');
            },
            update: function(user, avatar){
                var fd = new FormData();
                fd.append('user[first_name]', user.first_name);
                fd.append('user[last_name ]', user.last_name );
                fd.append('user[email]', user.email);
                fd.append('user[login]', user.login);
                fd.append('user[phone]', user.phone);
                fd.append('user[specialist_type]', user.specialist_type);
                fd.append('user[user_profession]', user.user_profession);

                if(avatar){
                    fd.append('user[avatar]', avatar);
                }

                return $http.put('/admin/users/' + user.id, fd, {
                    transformRequest: angular.identity,
                    headers: {'Content-Type': undefined}
                });
            },
            approve_specialist: function(user_id){
                return $http.post('admin/users/' + user_id + '/approve_specialist.json');
            },
            reject_specialist: function(user_id, reason){
                return $http.post('admin/users/' + user_id + '/reject_specialist.json', {reason: reason});
            },
            remove_specialist: function(user_id){
                return $http.post('admin/users/' + user_id + '/remove_specialist.json');
            }
        };
    }])
}());