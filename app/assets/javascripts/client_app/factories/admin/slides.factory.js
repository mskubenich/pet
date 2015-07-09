(function () {
    'use strict';
    angular.module('petModeAdminApp').factory('SlidesFactory', ['$http', function($http){
        return {
            all: function(options){
                return $http.get('admin/slides.json?page=' + options.page);
            },
            remove: function(id){
                return $http.delete('admin/slides/' + id + '.json');
            },
            show: function(id){
                return $http.get('admin/slides/' + id + '.json');
            },
            create: function(slide, image){
                var fd = new FormData();
                if(image){
                    fd.append('main_slide[image]', image);
                }

                return $http.post('/admin/slides', fd, {
                    transformRequest: angular.identity,
                    headers: {'Content-Type': undefined}
                });
            }
        };
    }])
}());