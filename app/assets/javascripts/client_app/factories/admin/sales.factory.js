(function () {
    'use strict';
    angular.module('petModeAdminApp').factory('SalesFactory', ['$http', function($http){
        return {
            upsert: function(sale, attachments, prize, bloodline, mothers_photo, fathers_photo){
                var fd = new FormData();
                fd.append('sale[family]', sale.family);
                fd.append('sale[name]', sale.name);
                fd.append('sale[age]', sale.age);
                fd.append('sale[breed_id]', sale.breed_id);
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

                if(sale.id){
                    return $http.put('/admin/sales/' + sale.id, fd, {
                        transformRequest: angular.identity,
                        headers: {'Content-Type': undefined}
                    });
                }else{
                    return $http.post('/admin/sales', fd, {
                        transformRequest: angular.identity,
                        headers: {'Content-Type': undefined}
                    });
                }
            },
            all: function(options){
                return $http.get('/admin/sales.json?page=' + options.page +
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
                return $http.get('/admin/sales/' + id + '.json');
            },
            destroy: function(id){
                return $http.delete('/admin/sales/' + id)
            },
            approve: function(id){
                return $http.post('/admin/sales/' + id + '/approve', {})
            },
            reject: function(id, reason){
                return $http.post('/admin/sales/' + id + '/reject', {reason: reason})
            }
        }
        ;
    }])
}());