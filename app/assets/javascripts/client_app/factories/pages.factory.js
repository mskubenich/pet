(function () {
    'use strict';
    angular.module('petModeApp').factory('PagesFactory', ['$http', function($http){
        return {
            get_slides: function(){
                return $http.get( I18n.locale + '/pages/slides.json')
            },
            get_sale_slides: function(){
                return $http.get( I18n.locale + '/pages/sale_slides.json')
            },
            get_copulation_slides: function(){
                return $http.get( I18n.locale + '/pages/copulation_slides.json')
            },
            get_shop_slides: function(){
                return $http.get( I18n.locale + '/pages/shop_slides.json')
            },
            news: function(){
                return $http.get( I18n.locale + '/news/popular.json')
            },
            get_main_slides: function(){
                return $http.get( I18n.locale + '/pages/main_slides.json')
            }
        };
    }])
}());