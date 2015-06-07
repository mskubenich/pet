(function () {
    'use strict';
    angular.module('petModeApp').factory('CopulationsFactory', ['$http', function($http){
        return {
            upsert: function(copulation, photo1, photo2, photo3, photo4, prize, bloodline, mothers_photo, fathers_photo){
                var fd = new FormData();
                fd.append('copulation[family]', copulation.family);
                fd.append('copulation[name]', copulation.name);
                fd.append('copulation[age]', copulation.age);
                fd.append('copulation[breed]', copulation.breed);
                fd.append('copulation[scorp]', copulation.scorp);
                fd.append('copulation[rkf]', copulation.rkf);
                fd.append('copulation[description]', copulation.description);
                fd.append('copulation[price]', copulation.price);
                if(photo1){
                    fd.append('copulation[photos][]', photo1);
                }
                if(photo2){
                    fd.append('copulation[photos][]', photo2);
                }
                if(photo3){
                    fd.append('copulation[photos][]', photo3);
                }
                if(photo4){
                    fd.append('copulation[photos][]', photo4);
                }
                if(prize){
                    fd.append('copulation[prize]', prize);
                }
                if(bloodline){
                    fd.append('copulation[bloodline]', bloodline);
                }
                if(mothers_photo){
                    fd.append('copulation[mothers_photo]', mothers_photo);
                }
                if(fathers_photo){
                    fd.append('copulation[fathers_photo]', fathers_photo);
                }

                //if(news.id){
                //    return $http.put('/admin/news/' + news.id, fd, {
                //        transformRequest: angular.identity,
                //        headers: {'Content-Type': undefined}
                //    });
                //}else{
                    return $http.post('/copulations', fd, {
                        transformRequest: angular.identity,
                        headers: {'Content-Type': undefined}
                    });
                //}
            },
            all: function(options){
                return $http.get('/copulations.json?page=' + options.page);
            }
        }
        ;
    }])
}());