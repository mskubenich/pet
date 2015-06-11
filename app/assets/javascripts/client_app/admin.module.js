(function () {
    "use strict";
    var petModeAdminApp = angular.module('petModeAdminApp', [
        'ui.router',
        'templates',
        'ngDialog',
        'validation.match',
        'validation.email',
        'fileread',
        'ui.bootstrap',
        'ui-rangeSlider'
    ]);

    petModeAdminApp.config(['$urlRouterProvider', '$stateProvider', function ($urlRouterProvider, $stateProvider) {
        $urlRouterProvider.otherwise('home');
        $stateProvider
            .state('home',{
                url: '',
                templateUrl: 'client_app/templates/admin/home/index.html',
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
            })
            .state('copulations',{
                url: '/copulations',
                templateUrl: 'client_app/templates/admin/copulations/index.html',
                controller: 'AdminCopulationsController'
            })
            .state('new_copulation',{
                url: '/copulations/new',
                templateUrl: 'client_app/templates/admin/copulations/new.html',
                controller: 'AdminCopulationsController'
            })
            .state('edit_copulation',{
                url: '/copulations/:id/edit',
                templateUrl: 'client_app/templates/admin/copulations/new.html',
                controller: 'AdminCopulationsController'
            })
            .state('sales',{
                url: '/sales',
                templateUrl: 'client_app/templates/admin/sales/index.html',
                controller: 'AdminSalesController'
            })
            .state('new_sale',{
                url: '/sales/new',
                templateUrl: 'client_app/templates/admin/sales/new.html',
                controller: 'AdminSalesController'
            })
            .state('edit_sale',{
                url: '/sales/:id/edit',
                templateUrl: 'client_app/templates/admin/sales/new.html',
                controller: 'AdminSalesController'
            });
    }]);

    petModeAdminApp.run(['$http', '$rootScope', function($http, $rootScope){
        var csrf_token = $('meta[name="csrf-token"]').attr('content');
        $http.defaults.headers.common['X-CSRF-Token'] = csrf_token;
    }]);


}());