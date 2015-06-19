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
                fd.append('user[rkf]', user.rkf);
                fd.append('user[scorp]', user.scorp);

                if(avatar){
                    fd.append('user[avatar]', avatar);
                }

                return $http.put('/admin/users/' + user.id, fd, {
                    transformRequest: angular.identity,
                    headers: {'Content-Type': undefined}
                });
            }
        };
    }])
}());