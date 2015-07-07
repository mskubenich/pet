(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('ProductsController', ['$scope', '$state', 'ngDialog', 'ProductsFactory', '$stateParams', '$timeout', '$sce', 'Lightbox', 'ShopCategoriesFactory',
            function ($scope, $state, ngDialog, products, $stateParams, $timeout, $sce, Lightbox, categories) {
            $('body').css('background-color', '#FAFAFA');
            $scope.I18n = I18n;
            $scope._ = _;

            $scope.$parent.header_url = 'client_app/templates/layouts/black-header.html';

            $scope.filters = {
                family: 'all',
                price: {
                    min: 0,
                    max: 100000
                },
                subcategory_id: null,
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

            if($state.current.name == 'products'){
                $scope.sale = [];

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
                            totalPages: Math.ceil($scope.count / 13),
                            startPage: $scope.page,
                            visiblePages: 13,
                            onPageClick: function (event, page) {
                                $scope.page = page;
                                $scope.retrieveProducts();
                            }
                        });
                    }).error(function (data) {

                    });
                };

                $scope.retrieveProducts();
            }
            if($state.current.name == 'show_product'){

                //setTimeout(function(){
                //    $scope.$watch('filters', function(){
                //        $state.go('sale');
                //    });
                //}, 100);

                $scope.sale = {};
                $scope.images = [];

                $scope.rate = 4;
                $scope.max = 5;
                $scope.isReadonly = false;

                $scope.hoveringOver = function(value) {
                    $scope.overStar = value;
                    $scope.percent = 100 * (value / $scope.max);
                };

                $scope.ratingStates = [
                    {stateOn: 'glyphicon-ok-sign', stateOff: 'glyphicon-ok-circle'},
                    {stateOn: 'glyphicon-star', stateOff: 'glyphicon-star-empty'},
                    {stateOn: 'glyphicon-heart', stateOff: 'glyphicon-ban-circle'},
                    {stateOn: 'glyphicon-heart'},
                    {stateOff: 'glyphicon-off'}
                ];

                sales.show($stateParams.id).success(function (data) {
                    $scope.sale = data.sale;
                    $scope.phone = $scope.sale.owner_phone_hashed;
                    $scope.preview_image = $scope.sale.preview_images[0];
                }).error(function (data) {

                });

                $scope.updatePreview = function(image){
                    $scope.preview_image = image;
                };

                $scope.showPhone = function(){
                    sales.showPhone($stateParams.id).success(function (data) {
                        $scope.phone = data.sale.owner_phone;
                    }).error(function (data) {
                        ngDialog.open({
                            className: 'ngdialog-theme-default',
                            template: I18n.t('actions.you_must_enter_before'),
                            plain: true
                        });
                    });
                };

                $scope.openLightboxModal = function (index) {
                    console.log(index);
                    Lightbox.openModal($scope.images, index);
                };

            }
        }])
}());