(function () {
    "use strict";
    var petModeAdminApp = angular.module('petModeAdminApp', [
        'ui.router',
        'templates',
        'ngDialog',
        'validation.match',
        'validation.email',
        'fileread'
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
            })
            .state('news',{
                url: '/news',
                templateUrl: 'client_app/templates/admin/news/index.html',
                controller: 'AdminNewsController'
            })
            .state('create_news',{
                url: '/create_news',
                templateUrl: 'client_app/templates/admin/news/new.html',
                controller: 'AdminNewsController'
            })
            .state('edit_news',{
                url: '/news/:id/edit',
                templateUrl: 'client_app/templates/admin/news/new.html',
                controller: 'AdminNewsController'
            })
            .state('static_pages',{
                url: '/static_pages',
                templateUrl: 'client_app/templates/admin/static_pages/index.html',
                controller: 'AdminStaticPagesController'
            })
            .state('static_page',{
                url: '/static_pages/:name/edit',
                templateUrl: 'client_app/templates/admin/static_pages/edit.html',
                controller: 'AdminStaticPagesController'
            });
    }]);

    petModeAdminApp.run(['$http', '$rootScope', function($http, $rootScope){
        var csrf_token = $('meta[name="csrf-token"]').attr('content');
        $http.defaults.headers.common['X-CSRF-Token'] = csrf_token;
    }]);


}());