(function () {
    'use strict';
    angular.module('petModeApp').factory('PagesFactory', ['$http', function($http){
        return {
            get_slides: function(){
                return $http.get( I18n.locale + '/pages/slides.json')
            }
        };
    }])
}());