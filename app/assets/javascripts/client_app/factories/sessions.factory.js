(function () {
    'use strict';
    angular.module('petModeApp').factory('SessionsFactory', ['$http', function($http){
        return {
            create: function(session) {
                return $http.post('sessions', {session: session});
            }
        };
    }])
}());