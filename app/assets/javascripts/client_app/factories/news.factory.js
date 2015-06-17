(function () {
    'use strict';
    angular.module('petModeApp').factory('NewsFactory', ['$http', function($http){
        return {
            show: function(news_id){
                return $http.get('/'+ gon.locale + '/news/' + news_id)
            },
            all: function(params){
                return $http.get('/' + gon.locale + '/news.json?page=' + params.page + '&categories=' + JSON.stringify(params.filters.categories));
            },
            categories: function(){
                return $http.get('/' + I18n.locale + '/news/categories.json');
            }
        };
    }])
}());