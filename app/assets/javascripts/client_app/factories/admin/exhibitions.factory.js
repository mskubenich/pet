(function () {
    'use strict';
    angular.module('petModeAdminApp').factory('ExhibitionsFactory', ['$http', function($http){
        return {
            upsert: function(exhibition, file){
                var fd = new FormData();
                if(file){
                    fd.append('exhibition[preview_image]', file);
                }
                fd.append('exhibition[title_ru]', exhibition.title_ru);
                fd.append('exhibition[title_en]', exhibition.title_en);
                fd.append('exhibition[body_ru]', exhibition.body_ru);
                fd.append('exhibition[body_en]', exhibition.body_en);
                fd.append('exhibition[scorp]', exhibition.scorp);
                fd.append('exhibition[rkf]', exhibition.rkf);

                if(exhibition.id){
                    return $http.put('/admin/exhibitions/' + exhibition.id, fd, {
                        transformRequest: angular.identity,
                        headers: {'Content-Type': undefined}
                    });
                }else{
                    return $http.post('/admin/exhibitions', fd, {
                        transformRequest: angular.identity,
                        headers: {'Content-Type': undefined}
                    });
                }
            },
            show: function(exhibition_id){
                return $http.get('/admin/exhibitions/' + exhibition_id)
            },
            all: function(params){
                return $http.get('/admin/exhibitions.json?page=' + params.page);
            },
            destroy: function(exhibition_id){
                return $http.delete('/admin/exhibitions/' + exhibition_id)
            }
        };
    }])
}());