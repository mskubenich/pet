(function () {
    'use strict';
    angular.module('petModeApp').factory('FriendsFactory', ['$http', function($http){
        return {
            create: function(id){
                return $http.post('/friendship/' + id, {});
            },
            decline: function(id){
                return $http.post('/friendship/' + id + '/decline', {});
            },
            cancel: function(id){
                return $http.post('/friendship/' + id + '/cancel', {});
            },
            accept: function(id){
                return $http.post('/friendship/' + id + '/accept', {});
            },
            remove: function(id){
                return $http.post('/friendship/' + id + '/delete', {});
            }
        };
    }])
}());