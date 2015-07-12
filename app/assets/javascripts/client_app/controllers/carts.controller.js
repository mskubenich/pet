(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('CartController', ['$scope', '$state', 'ngDialog', 'ShopCategoriesFactory', 'CartFactory', function ($scope, $state, ngDialog, categories, cart) {
            $('body').css('background-color', 'white');

            $scope.$parent.header_url = 'client_app/templates/layouts/black-header.html';

            $scope.filters = {
                family: 'all',
                price: {
                    min: 0,
                    max: 100000
                },
                category: {},
                subcategory: { id: ''},
                size: ''
            };

            $scope.sizes = [
                {title: 'Small'},
                {title: 'Normal'},
                {title: 'Large'}
            ];

            categories.all().success(function(data){
                $scope.categories = data.shop_categories;
            });

            cart.all()
                .success(function(data){
                    $scope.cart_items = data.items;
                })

        }])
}());