(function () {
    'use strict';
    angular.module('petModeAdminApp').factory('BreedsFactory', ['$http', function($http){
        return {
            upsert: function(breed){
                if(breed.id){
                    return $http.put('/admin/breeds/' + breed.id, breed);
                }else{
                    return $http.post('/admin/breeds', breed);
                }
            },
            show: function(id){
                return $http.get('/admin/breeds/' + id + '.json')
            },
            all: function(params){
                return $http.get('/admin/breeds.json?page=' + params.page);
            },
            destroy: function(id){
                return $http.delete('/admin/breeds/' + id)
            },
            titles: function(options){
                return $http.get('/admin/breeds/all.json?family=' + options.family);
            }
        };
    }])
}());