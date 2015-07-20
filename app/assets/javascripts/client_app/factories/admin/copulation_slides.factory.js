(function () {
    'use strict';
    angular.module('petModeAdminApp').factory('CopulationSlidesFactory', ['$http', function($http){
        return {
            all: function(options){
                return $http.get('admin/copulation_slides.json?page=' + options.page);
            },
            remove: function(id){
                return $http.delete('admin/copulation_slides/' + id + '.json');
            },
            show: function(id){
                return $http.get('admin/copulation_slides/' + id + '.json');
            },
            create: function(slide, image){
                var fd = new FormData();
                if(image){
                    fd.append('main_slide[image]', image);
                }

                return $http.post('/admin/copulation_slides', fd, {
                    transformRequest: angular.identity,
                    headers: {'Content-Type': undefined}
                });
            }
        };
    }])
}());