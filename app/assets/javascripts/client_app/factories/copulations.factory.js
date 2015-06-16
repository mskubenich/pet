(function () {
    'use strict';
    angular.module('petModeApp').factory('CopulationsFactory', ['$http', function($http){
        return {
            upsert: function(copulation, attachments, prize, bloodline, mothers_photo, fathers_photo){
                var fd = new FormData();
                fd.append('copulation[family]', copulation.family);
                fd.append('copulation[name]', copulation.name);
                fd.append('copulation[age]', copulation.age);
                fd.append('copulation[breed]', copulation.breed);
                fd.append('copulation[scorp]', copulation.scorp);
                fd.append('copulation[rkf]', copulation.rkf);
                fd.append('copulation[description]', copulation.description);
                fd.append('copulation[price]', copulation.price);
                var i = 0;
                while(i < attachments.length){
                    if(attachments[i] != 'null'){
                        fd.append('copulation[photos][]', attachments[i]);
                    }
                    i++
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
                return $http.get('/copulations.json?page=' + options.page +
                                            '&family=' + options.query.family +
                                            '&sex=' + options.query.sex +
                                            '&price_min=' + options.query.price.min +
                                            '&price_max=' + options.query.price.max +
                                            '&scorp=' + options.query.scorp +
                                            '&breed=' + options.query.breed +
                                            '&bloodline=' + options.query.bloodline +
                                            '&rkf=' + options.query.rkf);
            },
            show: function(id){
                return $http.get('/copulations/' + id + '.json');
            },
            showPhone: function(id){
                return $http.get('/copulations/' + id + '/show_phone.json');
            }
        }
        ;
    }])
}());