(function () {

    "use strict";

    angular.module('petModeAdminApp')
        .controller('AdminProductsController', ['$scope', '$state', 'ngDialog', '$stateParams', '$timeout', '$sce', 'ProductsFactory',
            function ($scope, $state, ngDialog, $stateParams, $timeout, $sce, products) {
                $scope.I18n = I18n;
                $scope._ = _;
                $scope.$state = $state;

                $scope.filters = {
                  title: '',
                  family: 'all'
                };

                $scope.getHtml = function(html){
                    return $sce.trustAsHtml(html);
                };

                if($state.current.name == 'products'){

                    $scope.products = [];

                    var timer = false;
                    $scope.$watch('filters', function(){
                        if(timer){
                            $timeout.cancel(timer)
                        }
                        timer= $timeout(function(){
                            $scope.retrieveProducts();
                        }, 500)
                    }, true);

                    $scope.page = 1;
                    $scope.retrieveProducts = function(){
                        products.all({page: $scope.page, query: $scope.filters}).success(function (data) {
                            $scope.products = data.products;
                            $scope.count = data.count;

                            var pagination = $('#products-pagination');
                            pagination.empty();
                            pagination.removeData('twbs-pagination');
                            pagination.unbind('page');

                            pagination.twbsPagination({
                                totalPages: Math.ceil($scope.count / 9),
                                startPage: $scope.page,
                                visiblePages: 9,
                                onPageClick: function (event, page) {
                                    $scope.page = page;
                                    $scope.retrieveProducts();
                                }
                            });
                        }).error(function (data) {

                        });
                    };

                    $scope.retrieveProducts();

                    $scope.destroy = function(id){
                        products.destroy(id).success(function(){
                            $scope.retrieveProducts();
                        })
                    };
                }

                if($state.current.name == 'new_product' || $state.current.name == 'edit_product'){


                    $scope.categories = [];
                    $scope.subcategories = [];
                    products.shop_categories()
                        .success(function(data){
                            $scope.categories = data.shop_categories;
                        });
                    $scope.$watch('product.category_id', function(){
                        $scope.subcategory_id = null;
                        products.shop_subcategories($scope.product.category_id)
                            .success(function(data){
                                $scope.subcategories = data.shop_subcategories;
                            });
                    });

                    if($state.current.name == 'new_product'){
                        $scope.product = {
                            title: '',
                            family: null,
                            description: '',
                            price: null
                        };
                    }

                    if($state.current.name == 'edit_product'){
                        products.show($stateParams.id)
                            .success(function(data){
                                $scope.product = data.product;
                            })
                    }

                    $scope.attachments = [];
                    $scope.attachments_previews = [];
                    $scope.removed_attachments_previews = [];

                    $scope.removeExistingAttachment = function(id){
                        $scope.removed_attachments_previews.push(id);
                        $(event.target).parents('.file-select').remove();
                    };

                    $scope.removeAttachment = function(i, event){
                        $scope.attachments[i] = 'null';
                        $(event.target).parents('.file-select').remove();
                    };

                    $scope.submitProduct = function(){
                        $scope.submited = true;
                        if($scope.productForm.$invalid ){
                            return false;
                        }

                        $scope.processing = true;
                        products.upsert($scope.product, $scope.attachments, $scope.prize, $scope.bloodline, $scope.mothers_photo, $scope.fathers_photo, $scope.removed_attachments_previews)
                            .success(function(){
                                $scope.processing = false;
                                ngDialog.open({
                                    className: 'ngdialog-theme-default',
                                    template: I18n.t('good_hands.messages.success_upsert'),
                                    plain: true
                                });
                            })
                            .error(function(data){
                                $scope.newsProcessing = false;
                                ngDialog.open({
                                    className: 'ngdialog-theme-default',
                                    template: JSON.stringify(data.errors),
                                    plain: true
                                });
                            })
                    };
                }
            }])
}());