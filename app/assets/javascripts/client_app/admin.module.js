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
            .state('edit_user',{
                url: '/user/:id/edit',
                templateUrl: 'client_app/templates/admin/users/edit.html',
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
            })
            .state('news_categories',{
                url: '/news_categories',
                templateUrl: 'client_app/templates/admin/news_categories/index.html',
                controller: 'AdminNewsCategoriesController'
            })
            .state('create_category',{
                url: '/create_category',
                templateUrl: 'client_app/templates/admin/news_categories/new.html',
                controller: 'AdminNewsCategoriesController'
            })
            .state('edit_category',{
                url: '/categories/:id/edit',
                templateUrl: 'client_app/templates/admin/news_categories/new.html',
                controller: 'AdminNewsCategoriesController'
            })
            .state('breeds',{
                url: '/breeds',
                templateUrl: 'client_app/templates/admin/breeds/index.html',
                controller: 'AdminBreedsController'
            })
            .state('create_breeds',{
                url: '/breeds/new',
                templateUrl: 'client_app/templates/admin/breeds/new.html',
                controller: 'AdminBreedsController'
            })
            .state('edit_breeds',{
                url: '/breeds/:id/edit',
                templateUrl: 'client_app/templates/admin/breeds/new.html',
                controller: 'AdminBreedsController'
            })
            .state('good_hands',{
                url: '/good_hands',
                templateUrl: 'client_app/templates/admin/good_hands/index.html',
                controller: 'AdminGoodHandsController'
            })
            .state('new_hand',{
                url: '/good_hands/new',
                templateUrl: 'client_app/templates/admin/good_hands/new.html',
                controller: 'AdminGoodHandsController'
            })
            .state('edit_hand',{
                url: '/good_hands/:id/edit',
                templateUrl: 'client_app/templates/admin/good_hands/new.html',
                controller: 'AdminGoodHandsController'
            })
            .state('shop_categories',{
                url: '/shop_categories',
                templateUrl: 'client_app/templates/admin/shop_categories/index.html',
                controller: 'AdminShopCategoriesController'
            })
            .state('create_shop_category',{
                url: '/create_shop_category',
                templateUrl: 'client_app/templates/admin/shop_categories/new.html',
                controller: 'AdminShopCategoriesController'
            })
            .state('edit_shop_category',{
                url: '/shop_categories/:id/edit',
                templateUrl: 'client_app/templates/admin/shop_categories/new.html',
                controller: 'AdminShopCategoriesController'
            })
            .state('shop_subcategories',{
                url: '/shop_categories/:shop_category_id/shop_subcategories',
                templateUrl: 'client_app/templates/admin/shop_subcategories/index.html',
                controller: 'AdminShopSubcategoriesController'
            })
            .state('create_shop_subcategory',{
                url: '/shop_categories/:shop_category_id/shop_subcategories/new',
                templateUrl: 'client_app/templates/admin/shop_subcategories/new.html',
                controller: 'AdminShopSubcategoriesController'
            })
            .state('edit_shop_subcategory',{
                url: '/shop_categories/:shop_category_id/shop_subcategories/:id/edit',
                templateUrl: 'client_app/templates/admin/shop_subcategories/new.html',
                controller: 'AdminShopSubcategoriesController'
            })
            .state('products',{
                url: '/products',
                templateUrl: 'client_app/templates/admin/products/index.html',
                controller: 'AdminProductsController'
            })
            .state('new_product',{
                url: '/products/new',
                templateUrl: 'client_app/templates/admin/products/new.html',
                controller: 'AdminProductsController'
            })
            .state('edit_product',{
                url: '/products/:id/edit',
                templateUrl: 'client_app/templates/admin/products/new.html',
                controller: 'AdminProductsController'
            })
            .state('slides',{
                url: '/slides',
                templateUrl: 'client_app/templates/admin/slides/index.html',
                controller: 'AdminSlidesController'
            })
            .state('new_slide',{
                url: '/slides/new',
                templateUrl: 'client_app/templates/admin/slides/new.html',
                controller: 'AdminSlidesController'
            })
            .state('orders',{
                url: '/orders',
                templateUrl: 'client_app/templates/admin/orders/index.html',
                controller: 'AdminOrdersController'
            })
            .state('order',{
                url: '/orders/:id',
                templateUrl: 'client_app/templates/admin/orders/show.html',
                controller: 'AdminOrdersController'
            })
            .state('copulation_slides',{
                url: '/copulation_slides',
                templateUrl: 'client_app/templates/admin/copulation_slides/index.html',
                controller: 'AdminCopulationSlidesController'
            })
            .state('new_copulation_slide',{
                url: '/copulation_slides/new',
                templateUrl: 'client_app/templates/admin/copulation_slides/new.html',
                controller: 'AdminCopulationSlidesController'
            })
            .state('competitions',{
                url: '/competitions',
                templateUrl: 'client_app/templates/admin/competitions/index.html',
                controller: 'AdminCompetitionsController'
            })
            .state('create_competition',{
                url: '/create_competition',
                templateUrl: 'client_app/templates/admin/competitions/new.html',
                controller: 'AdminCompetitionsController'
            })
            .state('edit_competition',{
                url: '/competitions/:id/edit',
                templateUrl: 'client_app/templates/admin/competitions/new.html',
                controller: 'AdminCompetitionsController'
            })
            .state('exhibitions',{
                url: '/exhibitions',
                templateUrl: 'client_app/templates/admin/exhibitions/index.html',
                controller: 'AdminExhibitionsController'
            })
            .state('create_exhibition',{
                url: '/create_exhibition',
                templateUrl: 'client_app/templates/admin/exhibitions/new.html',
                controller: 'AdminExhibitionsController'
            })
            .state('edit_exhibition',{
                url: '/exhibitions/:id/edit',
                templateUrl: 'client_app/templates/admin/exhibitions/new.html',
                controller: 'AdminExhibitionsController'
            });
    }]);

    petModeAdminApp.run(['$http', '$rootScope', function($http, $rootScope){
        var csrf_token = $('meta[name="csrf-token"]').attr('content');
        $http.defaults.headers.common['X-CSRF-Token'] = csrf_token;
    }]);

}());