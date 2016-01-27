(function () {
    'use strict';
    angular.module('petModeApp').factory('SessionsFactory', ['$http', function($http){
        return {
            create: function(session) {
                return $http.post('/sessions', {session: session});
            },
            currentUser: function() {
                return $http.get('/sessions/current_user_info');
            },
            currentSession: function() {
                return $http.get('/sessions/current_session_info');
            },
            destroy: function() {
                return $http.delete('/sessions');
            }
        };
    }])
}());