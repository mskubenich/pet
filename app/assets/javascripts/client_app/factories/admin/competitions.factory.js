(function () {
    'use strict';
    angular.module('petModeAdminApp').factory('CompetitionsFactory', ['$http', function($http){
        return {
            upsert: function(competition, file){
                var fd = new FormData();
                if(file){
                    fd.append('competition[preview_image]', file);
                }
                fd.append('competition[title_ru]', competition.title_ru);
                fd.append('competition[title_en]', competition.title_en);
                fd.append('competition[body_ru]', competition.body_ru);
                fd.append('competition[body_en]', competition.body_en);
                fd.append('competition[scorp]', competition.scorp);
                fd.append('competition[rkf]', competition.rkf);

                if(competition.id){
                    return $http.put('/admin/competitions/' + competition.id, fd, {
                        transformRequest: angular.identity,
                        headers: {'Content-Type': undefined}
                    });
                }else{
                    return $http.post('/admin/competitions', fd, {
                        transformRequest: angular.identity,
                        headers: {'Content-Type': undefined}
                    });
                }
            },
            show: function(competition_id){
                return $http.get('/admin/competitions/' + competition_id)
            },
            all: function(params){
                return $http.get('/admin/competitions.json?page=' + params.page);
            },
            destroy: function(competition_id){
                return $http.delete('/admin/competitions/' + competition_id)
            }
        };
    }])
}());