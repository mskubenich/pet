(function () {
    'use strict';
    angular.module('petModeAdminApp').factory('ProductsFactory', ['$http', function($http){
        return {
            upsert: function(product, attachments, prize, bloodline, mothers_photo, fathers_photo, removed_attachments_previews){
                var fd = new FormData();
                fd.append('product[family]', product.family);
                fd.append('product[title]', product.title);
                fd.append('product[description]', product.description);
                fd.append('product[price]', product.price);
                var i = 0;
                while(i < attachments.length){
                    if(attachments[i] != 'null'){
                        fd.append('product[photos][]', attachments[i]);
                    }
                    i++
                }
                i = 0;
                while(i < removed_attachments_previews.length){
                    if(removed_attachments_previews[i] != 'null'){
                        fd.append('product[removed_photos][]', removed_attachments_previews[i]);
                    }
                    i++
                }
                if(product.id){
                    return $http.put('/admin/products/' + product.id, fd, {
                        transformRequest: angular.identity,
                        headers: {'Content-Type': undefined}
                    });
                }else{
                    return $http.post('/admin/products', fd, {
                        transformRequest: angular.identity,
                        headers: {'Content-Type': undefined}
                    });
                }
            },
            all: function(options){
                return $http.get('/admin/products.json?page=' + options.page );
            },
            show: function(id){
                return $http.get('/admin/products/' + id + '.json');
            },
            destroy: function(id){
                return $http.delete('/admin/products/' + id)
            }
        }
            ;
    }])
}());