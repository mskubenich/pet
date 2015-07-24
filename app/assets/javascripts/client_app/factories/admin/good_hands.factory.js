(function () {
    'use strict';
    angular.module('petModeAdminApp').factory('GoodHandsFactory', ['$http', function($http){
        return {
            upsert: function(announcement, attachments, prize, bloodline, mothers_photo, fathers_photo, removed_attachments_previews){
                var fd = new FormData();
                fd.append('announcement[family]', announcement.family);
                fd.append('announcement[name]', announcement.name);
                fd.append('announcement[age]', announcement.age);
                fd.append('announcement[breed_id]', announcement.breed_id);
                fd.append('announcement[scorp]', announcement.scorp);
                fd.append('announcement[rkf]', announcement.rkf);
                fd.append('announcement[description]', announcement.description);
                fd.append('announcement[sex]', announcement.sex);
                fd.append('announcement[country]', announcement.country);
                fd.append('announcement[city]', announcement.city);
                fd.append('announcement[color]', announcement.color);
                fd.append('announcement[weight]', announcement.weight);
                var i = 0;
                while(i < attachments.length){
                    if(attachments[i] != 'null'){
                        fd.append('announcement[photos][]', attachments[i]);
                    }
                    i++
                }
                i = 0;
                while(i < removed_attachments_previews.length){
                    if(removed_attachments_previews[i] != 'null'){
                        fd.append('announcement[removed_photos][]', removed_attachments_previews[i]);
                    }
                    i++
                }
                if(prize){
                    fd.append('announcement[prize]', prize);
                }
                if(bloodline){
                    fd.append('announcement[bloodline]', bloodline);
                }
                if(mothers_photo){
                    fd.append('announcement[mothers_photo]', mothers_photo);
                }
                if(fathers_photo){
                    fd.append('announcement[fathers_photo]', fathers_photo);
                }

                if(announcement.id){
                    return $http.put('/admin/good_hands/' + announcement.id, fd, {
                        transformRequest: angular.identity,
                        headers: {'Content-Type': undefined}
                    });
                }else{
                    return $http.post('/admin/good_hands', fd, {
                        transformRequest: angular.identity,
                        headers: {'Content-Type': undefined}
                    });
                }
            },
            all: function(options){
                return $http.get('/admin/good_hands.json?page=' + options.page +
                                            '&family=' + options.query.family +
                                            '&sex=' + options.query.sex +
                                            '&scorp=' + options.query.scorp +
                                            '&breed_id=' + options.query.breed_id +
                                            '&status=' + options.query.status +
                                            '&rkf=' + options.query.rkf);
            },
            show: function(id){
                return $http.get('/admin/good_hands/' + id + '.json');
            },
            destroy: function(id){
                return $http.delete('/admin/good_hands/' + id)
            },
            approve: function(id){
                return $http.post('/admin/good_hands/' + id + '/approve', {})
            },
            reject: function(id, reason){
                return $http.post('/admin/good_hands/' + id + '/reject', {reason: reason})
            }
        }
        ;
    }])
}());