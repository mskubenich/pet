(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('ProductsController', ['$scope', '$state', 'ngDialog', 'ProductsFactory', '$stateParams', '$timeout', '$sce',
            'Lightbox', 'ShopCategoriesFactory', 'CommentsFactory', 'NotesFactory', 'CartFactory',
            function ($scope, $state, ngDialog, products, $stateParams, $timeout, $sce, Lightbox, categories, comments, notes, cart) {

            $scope.I18n = I18n;
            $scope._ = _;

            $scope.$parent.header_url = 'black';

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

            $scope.addToCart = function(product_id){
                cart.add(product_id).success(function(){
                    $scope.current_user.cart_items_count =  $scope.current_user.cart_items_count + 1;
                    ngDialog.open({
                        className: 'ngdialog-theme-default',
                        template: I18n.t('shop.messages.success_add_to_cart'),
                        plain: true
                    });
                })
            };

            if($state.current.name == 'products'){
                $('body').css('background-color', '#FAFAFA');
                var timer = false;
                $scope.$watch('filters', function(){
                    $scope.retrieveProducts();
                }, true);

                $scope.watchers = {};
                $scope.updateRate = function(product_id){
                    if($scope.watchers[product_id]){
                        $scope.watchers[product_id]();
                    }
                    $scope.watchers[product_id] = $scope.$watch('products[' + product_id + '].rating.rating', function(){
                        if ($scope.products[product_id].initializing) {
                            $timeout(function() { $scope.products[product_id].initializing = false; });
                        } else {
                            $scope.products[product_id].rating.isReadonly = true;
                            notes.create({points: $scope.products[product_id].rating.rating, entity_type: 'Product', entity_id: $scope.products[product_id].id})
                                .success(function(data){
                                    $scope.products[product_id].initializing = true;
                                    $scope.products[product_id].rating.rating = data.note.rating;
                                    $scope.products[product_id].rating.isReadonly = data.note.readonly;
                                    $scope.products[product_id].rating.voices_count = data.note.voices_count;
                                });
                        }
                    });
                };

                $scope.page = 1;
                $scope.retrieveProducts = function(){
                    if(timer){
                        $timeout.cancel(timer)
                    }
                    timer = $timeout(function(){

                        products.all({page: $scope.page, query: $scope.filters}).success(function (data) {
                            $scope.products = data.products;
                            $scope.new_product = data.new_product;
                            $scope.count = data.count;

                            var pagination = $('#products-pagination');
                            pagination.empty();
                            pagination.removeData('twbs-pagination');
                            pagination.unbind('page');

                            pagination.twbsPagination({
                                totalPages: Math.ceil($scope.count / 13),
                                startPage: $scope.page,
                                visiblePages: 13,
                                onPageClick: function (event, page) {
                                    $scope.page = page;
                                    $scope.retrieveProducts();
                                }
                            });

                            for(var i = 0; i < $scope.products.length; i++){
                                $scope.products[i].initializing = true;
                                $scope.updateRate(i);
                            }
                        }).error(function (data) {

                        });
                    }, 500);
                };

                $scope.retrieveProducts();
            }
            if($state.current.name == 'show_product'){
                $('body').css('background-color', 'white');
                //setTimeout(function(){
                //    $scope.$watch('filters', function(){
                //        $state.go('sale');
                //    });
                //}, 100);

                $scope.product = {};
                $scope.rating = {
                    rating: 0,
                    max: 5,
                    isReadonly: true,
                    voices_count: 0
                };
                $scope.hoveringOver = function(value) {
                    $scope.overStar = value;
                    $scope.percent = 100 * (value / $scope.max);
                };
                var initializing = true;

                products.show($stateParams.id).success(function (data) {
                    $scope.product = data.product;

                    notes.show({entity_type: 'Product', entity_id: $scope.product.id})
                        .success(function(data){
                            $scope.rating.rating = data.note.rating;
                            $scope.rating.isReadonly = data.note.readonly;
                            $scope.rating.voices_count = data.note.voices_count;
                            $scope.$watch('rating.rating', function(){
                                if (initializing) {
                                    $timeout(function() { initializing = false; });
                                } else {
                                    $scope.rating.isReadonly = true;
                                    notes.create({points: $scope.rating.rating, entity_type: 'Product', entity_id: $scope.product.id})
                                        .success(function(){
                                            initializing = true;
                                            notes.show({entity_type: 'Product', entity_id: $scope.product.id})
                                                .success(function(data){
                                                    $scope.rating.rating = data.note.rating;
                                                    $scope.rating.isReadonly = data.note.readonly;
                                                    $scope.rating.voices_count = data.note.voices_count;
                                                });
                                        });
                                }
                            });
                        });

                    $scope.preview_image = $scope.product.preview_images[0];
                }).error(function (data) {

                });

                $scope.updatePreview = function(image){
                    $scope.preview_image = image;
                };

                $scope.openLightboxModal = function (index) {
                    console.log(index);
                    Lightbox.openModal($scope.product.preview_images, index);
                };

                $scope.comments_page = 1;
                $scope.retrieveComments = function(){
                    comments.all({page: $scope.comments_page, entity_type: 'Product', entity_id: $stateParams.id}).success(function (data) {
                        $scope.comments = data.comments;
                        $scope.count = data.count;

                        var pagination = $('#comments-pagination');
                        pagination.empty();
                        pagination.removeData('twbs-pagination');
                        pagination.unbind('page');
                        if($scope.count > 0){
                            pagination.twbsPagination({
                                totalPages: Math.ceil($scope.count / 10),
                                startPage: $scope.comments_page,
                                visiblePages: 9,
                                onPageClick: function (event, page) {
                                    $scope.comments_page = page;
                                    $scope.retrieveComments();
                                }
                            });
                        }
                    }).error(function (data) {

                    });
                };

                $scope.retrieveComments();

                $scope.new_comment = '';
                $scope.comment = function(){
                    if($scope.new_comment.toString().trim() != ''){
                        comments.create({text: $scope.new_comment, entity_id: $stateParams.id, entity_type: 'Product'}).success(function(){
                            $scope.new_comment = '';
                            $scope.retrieveComments();
                        })
                    }
                }
            }
        }])
}());