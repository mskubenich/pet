(function () {
    'use strict';
    angular.module('petModeAdminApp').factory('NewsFactory', ['$http', function($http){
        return {
            create: function(news){
                return $http.post('admin/news', {news: news});
            },
            all: function(){
                return $http.get('admin/news');
            }
        };
    }])
}());