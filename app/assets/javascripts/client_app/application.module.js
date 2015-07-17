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
        'bootstrapLightbox',
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
            .state('home2',{
                url: '/home',
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
            .state('user',{
                url: '/users/:id',
                templateUrl: 'client_app/templates/users/show.html',
                controller: 'UsersController'
            })
            .state('login',{
                url: '/login',
                templateUrl: 'client_app/templates/sessions/new.html',
                controller: 'SessionsController'
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
            })
            .state('good_hands',{
                url: '/good-hands',
                templateUrl: 'client_app/templates/good_hands/index.html',
                controller: 'GoodHandsController'
            })
            .state('new_hand',{
                url: '/good_hands/new',
                templateUrl: 'client_app/templates/good_hands/new.html',
                controller: 'GoodHandsController'
            })
            .state('show_hand',{
                url: '/good_hands/:id',
                templateUrl: 'client_app/templates/good_hands/show.html',
                controller: 'GoodHandsController'
            })
            .state('products',{
                url: '/products',
                templateUrl: 'client_app/templates/products/index.html',
                controller: 'ProductsController'
            })
            .state('show_product',{
                url: '/products/:id',
                templateUrl: 'client_app/templates/products/show.html',
                controller: 'ProductsController'
            })
            .state('cart',{
                url: '/cart',
                templateUrl: 'client_app/templates/shop/cart.html',
                controller: 'CartController'
            })
            .state('order',{
                url: '/order',
                templateUrl: 'client_app/templates/shop/order.html',
                controller: 'OrderController'
            })
            .state('messages',{
                url: '/messages',
                templateUrl: 'client_app/templates/messages/index.html',
                controller: 'ProfileController'
            })
            .state('user_messages',{
                url: '/messages/:id',
                templateUrl: 'client_app/templates/messages/user_messages.html',
                controller: 'ProfileController'
            })
            .state('settings',{
                url: '/settings',
                templateUrl: 'client_app/templates/settings/index.html',
                controller: 'ProfileController'
            })
            .state('my-pets',{
                url: '/my-pets',
                templateUrl: 'client_app/templates/my-pets/index.html',
                controller: 'ProfileController'
            })
            .state('friends',{
                url: '/friends',
                templateUrl: 'client_app/templates/friends/index.html',
                controller: 'ProfileController'
            });
    }]);

    petModeApp.run(['$http', '$rootScope', function($http, $rootScope){
        var csrf_token = $('meta[name="csrf-token"]').attr('content');
        $http.defaults.headers.common['X-CSRF-Token'] = csrf_token;
    }]);


}());