(function () {
    "use strict";
    var petModeApp = angular.module('petModeApp', [
        'ui.router',
        'templates',
        'ngDialog',
        'validation.match',
        'validation.email',
        'fileread'
    ]);

    petModeApp.config(['$urlRouterProvider', '$stateProvider', function ($urlRouterProvider, $stateProvider) {
        $urlRouterProvider.otherwise('home');
        $stateProvider
            .state('home',{
                url: '',
                templateUrl: 'client_app/templates/home/index.html',
                controller: 'HomeController'
            })
            .state('registration',{
                url: '/registration',
                templateUrl: 'client_app/templates/users/new.html',
                controller: 'UsersController'
            })
            .state('sale',{
                url: '/sale',
                templateUrl: 'client_app/templates/sale/index.html',
                controller: 'SaleController'
            })
            .state('copulation',{
                url: '/copulation',
                templateUrl: 'client_app/templates/copulation/index.html',
                controller: 'CopulationController'
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
            });
    }]);

    petModeApp.run(['$http', '$rootScope', function($http, $rootScope){
        var csrf_token = $('meta[name="csrf-token"]').attr('content');
        $http.defaults.headers.common['X-CSRF-Token'] = csrf_token;
    }]);


}());