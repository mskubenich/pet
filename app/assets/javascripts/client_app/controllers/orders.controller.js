(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('OrderController', ['$scope', '$state', 'ngDialog', 'ShopCategoriesFactory', 'CartFactory', 'OrderFactory',
            function ($scope, $state, ngDialog, categories, cart, order) {
            $('body').css('background-color', 'white');

            $scope.$parent.header_url = 'black';

            $scope.$parent.initShopSlides();

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

            $scope.retrieveItems = function(){
                cart.all()
                    .success(function(data){
                        $scope.cart_items = data.items;
                        $scope.total_price = data.total_price;
                    })

            };
            $scope.retrieveItems();

            $scope.removeItem = function(item_id){
                cart.destroy(item_id).success(function(){
                    $scope.retrieveItems();
                })
            };

            $scope.increaseCount = function(item){
                cart.set_count(item.id, item.count + 1).success(function(){
                    $scope.retrieveItems();
                })
            };

            $scope.decreaseCount = function(item){
                cart.set_count(item.id, item.count - 1).success(function(){
                    $scope.retrieveItems();
                })
            };

            $scope.address = {};
            $scope.submitOrder = function(){
                $scope.submited = true;
                order.create($scope.address).success(function(){
                    $state.go('cart');
                    ngDialog.open({
                        className: 'ngdialog-theme-default',
                        template: 'Оплачено',
                        plain: true
                    });
                })
            }
        }])
}());