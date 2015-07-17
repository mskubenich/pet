(function () {
    'use strict';
    angular.module('petModeApp').factory('MessagesFactory', ['$http', function($http){
        return {
            send: function(options){
                return $http.post('/messages', { user_id: options.user_id, text: options.text });
            },
            show: function(id){
                return $http.get('/messages/' + id);
            },
            all: function(){
                return $http.get('/messages');
            }
        }
        ;
    }])
}());