(function () {
    'use strict';
    angular.module('petModeApp').factory('GoodHandsFactory', ['$http', function($http){
        return {
            upsert: function(announcement, attachments, prize, bloodline, mothers_photo, fathers_photo){
                var fd = new FormData();
                fd.append('announcement[family]', announcement.family);
                fd.append('announcement[name]', announcement.name);
                fd.append('announcement[age]', announcement.age);
                fd.append('announcement[breed_id]', announcement.breed_id);
                fd.append('announcement[scorp]', announcement.scorp);
                fd.append('announcement[rkf]', announcement.rkf);
                fd.append('announcement[description]', announcement.description);
                fd.append('announcement[price]', announcement.price);
                var i = 0;
                while(i < attachments.length){
                    if(attachments[i] != 'null'){
                        fd.append('announcement[photos][]', attachments[i]);
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

                //if(news.id){
                //    return $http.put('/admin/news/' + news.id, fd, {
                //        transformRequest: angular.identity,
                //        headers: {'Content-Type': undefined}
                //    });
                //}else{
                    return $http.post('/good_hands', fd, {
                        transformRequest: angular.identity,
                        headers: {'Content-Type': undefined}
                    });
                //}
            },
            all: function(options){
                return $http.get('/good_hands.json?page=' + options.page +
                                            '&family=' + options.query.family +
                                            '&sex=' + options.query.sex +
                                            '&price_min=' + options.query.price.min +
                                            '&price_max=' + options.query.price.max +
                                            '&scorp=' + options.query.scorp +
                                            '&breed_id=' + options.query.breed_id +
                                            '&bloodline=' + options.query.bloodline +
                                            '&rkf=' + options.query.rkf);
            },
            show: function(id){
                return $http.get('/good_hands/' + id + '.json');
            },
            showPhone: function(id){
                return $http.get('/good_hands/' + id + '/show_phone.json');
            }
        }
        ;
    }])
}());