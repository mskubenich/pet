(function () {
    'use strict';
    angular.module('petModeAdminApp').factory('NewsFactory', ['$http', function($http){
        return {
            upsert: function(news, file){
                var fd = new FormData();
                if(file){
                    fd.append('news[preview_image]', file);
                }
                fd.append('news[title]', news.title);
                fd.append('news[body]', news.body);
                fd.append('news[scorp]', news.scorp);
                fd.append('news[rkf]', news.rkf);

                if(news.id){
                    return $http.put('admin/news/' + news.id, fd, {
                        transformRequest: angular.identity,
                        headers: {'Content-Type': undefined}
                    });
                }else{
                    return $http.post('admin/news', fd, {
                        transformRequest: angular.identity,
                        headers: {'Content-Type': undefined}
                    });
                }
            },
            show: function(news_id){
                return $http.get('admin/news/' + news_id)
            },
            all: function(params){
                return $http.get('admin/news.json?page=' + params.page);
            }
        };
    }])
}());