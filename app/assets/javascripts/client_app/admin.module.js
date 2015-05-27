(function () {
    "use strict";
    var petModeAdminApp = angular.module('petModeAdminApp', [
        'ui.router',
        'templates',
        'ngDialog',
        'validation.match',
        'validation.email'
    ]);

    petModeAdminApp.config(['$urlRouterProvider', '$stateProvider', function ($urlRouterProvider, $stateProvider) {
        $urlRouterProvider.otherwise('home');
        $stateProvider
            .state('home',{
                url: '',
                templateUrl: 'client_app/templates/home/index.html',
                controller: 'AdminHomeController'
            })
            .state('users',{
                url: '/users',
                templateUrl: 'client_app/templates/admin/users/index.html',
                controller: 'AdminUsersController'
            });
    }]);

    petModeAdminApp.run(['$http', '$rootScope', function($http, $rootScope){
        var csrf_token = $('meta[name="csrf-token"]').attr('content');
        $http.defaults.headers.common['X-CSRF-Token'] = csrf_token;
    }]);


}());