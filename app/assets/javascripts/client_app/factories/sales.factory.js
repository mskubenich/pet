(function () {
    'use strict';
    angular.module('petModeApp').factory('SalesFactory', ['$http', function($http){
        return {
            upsert: function(sale, attachments, prize, bloodline, mothers_photo, fathers_photo){
                var fd = new FormData();
                fd.append('sale[family]', sale.family);
                fd.append('sale[name]', sale.name);
                fd.append('sale[age]', sale.age);
                fd.append('sale[breed]', sale.breed);
                fd.append('sale[scorp]', sale.scorp);
                fd.append('sale[rkf]', sale.rkf);
                fd.append('sale[description]', sale.description);
                fd.append('sale[price]', sale.price);
                var i = 0;
                while(i < attachments.length){
                    if(attachments[i] != 'null'){
                        fd.append('sale[photos][]', attachments[i]);
                    }
                    i++
                }
                if(prize){
                    fd.append('sale[prize]', prize);
                }
                if(bloodline){
                    fd.append('sale[bloodline]', bloodline);
                }
                if(mothers_photo){
                    fd.append('sale[mothers_photo]', mothers_photo);
                }
                if(fathers_photo){
                    fd.append('sale[fathers_photo]', fathers_photo);
                }

                //if(news.id){
                //    return $http.put('/admin/news/' + news.id, fd, {
                //        transformRequest: angular.identity,
                //        headers: {'Content-Type': undefined}
                //    });
                //}else{
                    return $http.post('/sales', fd, {
                        transformRequest: angular.identity,
                        headers: {'Content-Type': undefined}
                    });
                //}
            },
            all: function(options){
                return $http.get('/sales.json?page=' + options.page +
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
                return $http.get('/sales/' + id + '.json');
            }
        }
        ;
    }])
}());