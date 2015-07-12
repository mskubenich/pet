(function () {
    'use strict';
    angular.module('petModeAdminApp').factory('NewsFactory', ['$http', function($http){
        return {
            upsert: function(news, file){
                var fd = new FormData();
                if(file){
                    fd.append('news[preview_image]', file);
                }
                fd.append('news[title_ru]', news.title_ru);
                fd.append('news[title_en]', news.title_en);
                fd.append('news[body_ru]', news.body_ru);
                fd.append('news[body_en]', news.body_en);
                fd.append('news[scorp]', news.scorp);
                fd.append('news[rkf]', news.rkf);
                fd.append('news[news_category_id]', news.news_category_id);
                if(news.categories){
                    var i = 0;
                    while(i< news.categories.length){
                        fd.append('news[categories][]', news.categories[i]);
                        i++;
                    }
                }

                if(news.id){
                    return $http.put('/admin/news/' + news.id, fd, {
                        transformRequest: angular.identity,
                        headers: {'Content-Type': undefined}
                    });
                }else{
                    return $http.post('/admin/news', fd, {
                        transformRequest: angular.identity,
                        headers: {'Content-Type': undefined}
                    });
                }
            },
            show: function(news_id){
                return $http.get('/admin/news/' + news_id)
            },
            all: function(params){
                return $http.get('/admin/news.json?page=' + params.page);
            },
            destroy: function(news_id){
                return $http.delete('/admin/news/' + news_id)
            }
        };
    }])
}());