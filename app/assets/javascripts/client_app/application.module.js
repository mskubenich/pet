(function () {
    "use strict";
    var petModeApp = angular.module('petModeApp', [
        'ui.router',
        'templates',
        'ngDialog',
        'validation.match',
        'validation.email',
        'fileread',
        'ui.bootstrap',
        'ui-rangeSlider'
    ]);

    petModeApp.config(['$urlRouterProvider', '$stateProvider', '$httpProvider', function ($urlRouterProvider, $stateProvider, $httpProvider) {

        $httpProvider.defaults.headers.common['X-Requested-With'] = 'AngularXMLHttpRequest';

        $urlRouterProvider.otherwise('home');
        $stateProvider
            .state('home',{
                url: '',
                templateUrl: 'client_app/templates/home/index.html',
                controller: 'HomeController'
            })
            .state('profile',{
                url: '/profile',
                templateUrl: 'client_app/templates/users/profile.html',
                controller: 'ProfileController'
            })
            .state('registration',{
                url: '/registration',
                templateUrl: 'client_app/templates/users/new.html',
                controller: 'UsersController'
            })
            .state('login',{
                url: '/login',
                templateUrl: 'client_app/templates/sessions/new.html',
                controller: 'SessionsController'
            })
            .state('pet-shop',{
                url: '/pet-shop',
                templateUrl: 'client_app/templates/shop/index.html',
                controller: 'ShopController'
            })
            .state('good-hands',{
                url: '/good-hands',
                templateUrl: 'client_app/templates/hands/index.html',
                controller: 'HandsController'
            })
            .state('experts',{
                url: '/experts',
                templateUrl: 'client_app/templates/experts/index.html',
                controller: 'ExpertsController'
            })
            .state('news',{
                url: '/news',
                templateUrl: 'client_app/templates/news/index.html',
                controller: 'NewsController'
            })
            .state('show_news',{
                url: '/news/:id',
                templateUrl: 'client_app/templates/news/show.html',
                controller: 'NewsController'
            })
            .state('help',{
                url: '/help',
                templateUrl: 'client_app/templates/pages/dynamic.html',
                controller: 'PagesController'
            })
            .state('rules',{
                url: '/rules',
                templateUrl: 'client_app/templates/pages/dynamic.html',
                controller: 'PagesController'
            })
            .state('team',{
                url: '/team',
                templateUrl: 'client_app/templates/pages/dynamic.html',
                controller: 'PagesController'
            })
            .state('contacts',{
                url: '/contacts',
                templateUrl: 'client_app/templates/pages/dynamic.html',
                controller: 'PagesController'
            })
            .state('copulation',{
                url: '/copulation',
                templateUrl: 'client_app/templates/copulation/index.html',
                controller: 'CopulationController'
            })
            .state('new_copulation',{
                url: '/copulation/new',
                templateUrl: 'client_app/templates/copulation/new.html',
                controller: 'CopulationController'
            })
            .state('show_copulation',{
                url: '/copulation/:id',
                templateUrl: 'client_app/templates/copulation/show.html',
                controller: 'CopulationController'
            })
            .state('sale',{
                url: '/sale',
                templateUrl: 'client_app/templates/sales/index.html',
                controller: 'SalesController'
            })
            .state('new_sale',{
                url: '/sale/new',
                templateUrl: 'client_app/templates/sales/new.html',
                controller: 'SalesController'
            })
            .state('show_sale',{
                url: '/sale/:id',
                templateUrl: 'client_app/templates/sales/show.html',
                controller: 'SalesController'
            });
    }]);

    petModeApp.run(['$http', '$rootScope', function($http, $rootScope){
        var csrf_token = $('meta[name="csrf-token"]').attr('content');
        $http.defaults.headers.common['X-CSRF-Token'] = csrf_token;
    }]);


}());