(function () {
    'use strict';
    angular.module('petModeApp').factory('NewsFactory', ['$http', function($http){
        return {
            show: function(news_id){
                return $http.get('/'+ gon.locale + '/news/' + news_id)
            },
            all: function(params){
                return $http.get('/' + gon.locale + '/news.json?page=' + params.page);
            }
        };
    }])
}());