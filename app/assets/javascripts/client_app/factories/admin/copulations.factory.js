(function () {
    'use strict';
    angular.module('petModeAdminApp').factory('CopulationsFactory', ['$http', function($http){
        return {
            upsert: function(copulation, attachments, prize, bloodline, mothers_photo, fathers_photo, removed_attachments_previews){
                var fd = new FormData();
                fd.append('copulation[family]', copulation.family);
                fd.append('copulation[name]', copulation.name);
                fd.append('copulation[age]', copulation.age);
                fd.append('copulation[breed_id]', copulation.breed_id);
                fd.append('copulation[scorp]', copulation.scorp);
                fd.append('copulation[rkf]', copulation.rkf);
                fd.append('copulation[description]', copulation.description);
                fd.append('copulation[price]', copulation.price);
                fd.append('copulation[sex]', copulation.sex);
                fd.append('copulation[country]', copulation.country);
                fd.append('copulation[city]', copulation.city);
                fd.append('copulation[color]', copulation.color);
                fd.append('copulation[weight]', copulation.weight);
                var i = 0;
                while(i < removed_attachments_previews.length){
                    fd.append('copulation[removed_photos][]', removed_attachments_previews[i]);
                    i++
                }
                i = 0;
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

                if(copulation.id){
                    return $http.put('/admin/copulations/' + copulation.id, fd, {
                        transformRequest: angular.identity,
                        headers: {'Content-Type': undefined}
                    });
                }else{
                    return $http.post('/admin/copulations', fd, {
                        transformRequest: angular.identity,
                        headers: {'Content-Type': undefined}
                    });
                }
            },
            all: function(options){
                return $http.get('/admin/copulations.json?page=' + options.page +
                                            '&family=' + options.query.family +
                                            '&sex=' + options.query.sex +
                                            '&price_min=' + options.query.price.min +
                                            '&price_max=' + options.query.price.max +
                                            '&scorp=' + options.query.scorp +
                                            '&breed_id=' + options.query.breed_id +
                                            '&bloodline=' + options.query.bloodline +
                                            '&status=' + options.query.status +
                                            '&rkf=' + options.query.rkf);
            },
            show: function(id){
                return $http.get('/admin/copulations/' + id + '.json');
            },
            destroy: function(id){
                return $http.delete('/admin/copulations/' + id)
            },
            approve: function(id){
                return $http.post('/admin/copulations/' + id + '/approve', {})
            },
            reject: function(id, reason){
                return $http.post('/admin/copulations/' + id + '/reject', {reason: reason})
            }
        }
        ;
    }])
}());