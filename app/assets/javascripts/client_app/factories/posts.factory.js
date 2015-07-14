(function () {
    'use strict';
    angular.module('petModeApp').factory('PostsFactory', ['$http', function($http){
        return {
            upsert: function(post, image){
                var fd = new FormData();
                fd.append('post[title]', post.title);
                fd.append('post[body]',  post.body);
                fd.append('post[scorp]', post.scorp);
                fd.append('post[rkf]',   post.rkf);
                if(image){
                    fd.append('post[image]', image);
                }

                if(post.id){
                    return $http.put('/posts/' + post.id, fd, {
                        transformRequest: angular.identity,
                        headers: {'Content-Type': undefined}
                    });
                }else{
                    return $http.post('/posts', fd, {
                        transformRequest: angular.identity,
                        headers: {'Content-Type': undefined}
                    });
                }
            },
            all: function(options){
                return $http.get('/posts');
            }
        }
        ;
    }])
}());