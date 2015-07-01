(function () {
    'use strict';
    angular.module('petModeApp').factory('CommentsFactory', ['$http', function($http){
        return {
            all: function(options){
                return $http.get('/comments.json?page=' + options.page + '&entity_id=' + options.entity_id + '&entity_type=' + options.entity_type);
            }
        };
    }])
}());