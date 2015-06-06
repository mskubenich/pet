(function () {
    'use strict';
    angular.module('petModeApp').factory('CopulationsFactory', ['$http', function($http){
        return {
            upsert: function(copulation){
                var fd = new FormData();
                fd.append('copulation[family]', copulation.family);
                fd.append('copulation[name]', copulation.name);
                fd.append('copulation[age]', copulation.age);
                fd.append('copulation[breed]', copulation.breed);
                fd.append('copulation[scorp]', copulation.scorp);
                fd.append('copulation[rkf]', copulation.rkf);
                fd.append('copulation[description]', copulation.description);
                fd.append('copulation[price]', copulation.price);

                //if(news.id){
                //    return $http.put('/admin/news/' + news.id, fd, {
                //        transformRequest: angular.identity,
                //        headers: {'Content-Type': undefined}
                //    });
                //}else{
                    return $http.post('/admin/copulations', fd, {
                        transformRequest: angular.identity,
                        headers: {'Content-Type': undefined}
                    });
                //}
            },
        };
    }])
}());