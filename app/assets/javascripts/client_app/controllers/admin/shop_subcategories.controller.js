(function () {

    "use strict";

    angular.module('petModeAdminApp')
        .controller('AdminShopSubcategoriesController', ['$sce', '$scope', '$state', 'ngDialog', 'ShopCategoriesFactory', 'ShopSubcategoriesFactory', '$stateParams', '$rootScope',
            function ($sce, $scope, $state, ngDialog, categories, subcategories, $stateParams, $rootScope) {
            $rootScope.$state = $state;


            categories.show($stateParams.shop_category_id).success(function(data){
                $scope.shop_category = data.category;
            });

            if($state.current.name == 'create_shop_subcategory' || $state.current.name == 'edit_shop_subcategory'){

                if($state.current.name == 'create_shop_subcategory'){
                    $scope.subcategory = {};
                }

                if($state.current.name == 'edit_shop_subcategory'){

                    subcategories.show($stateParams.shop_category_id, $stateParams.id)
                        .success(function(data){
                            $scope.subcategory = data.subcategory;
                        })
                }

                $scope.submitted = false;

                $scope.upsertSubcategory = function(){
                    $scope.submited = true;
                    if($scope.subcategoryForm.$invalid ){
                        return false;
                    }

                    $scope.processing = true;
                    subcategories.upsert({category_id: $scope.shop_category.id, subcategory: $scope.subcategory})
                        .success(function(){
                            $scope.processing = false;
                            ngDialog.open({
                                className: 'ngdialog-theme-default',
                                template: I18n.t('shop_subcategory.messages.success_upsert'),
                                plain: true
                            });
                        })
                        .error(function(data){
                            $scope.processing = false;
                            ngDialog.open({
                                className: 'ngdialog-theme-default',
                                template: JSON.stringify(data.errors),
                                plain: true
                            });
                        })
                };
            }

            if($state.current.name == 'shop_subcategories'){
                $scope.categories = [];

                $scope.page = 1;
                $scope.retrieveSubcategories = function(){
                    subcategories.all({shop_category_id: $stateParams.shop_category_id, page: $scope.page}).success(function (data) {
                        $scope.subcategories = data.subcategories;
                        $scope.count = data.count;

                        var pagination = $('#subcategories-pagination');
                        pagination.empty();
                        pagination.removeData('twbs-pagination');
                        pagination.unbind('page');

                        pagination.twbsPagination({
                            totalPages: Math.ceil($scope.count / 10),
                            startPage: $scope.page,
                            visiblePages: 9,
                            onPageClick: function (event, page) {
                                $scope.page = page;
                                $scope.retrieveCategories();
                            }
                        });
                    }).error(function (data) {

                    });
                };

                $scope.destroy = function(id){
                    subcategories.destroy($scope.shop_category.id, id).success(function(){
                        $scope.retrieveSubcategories();
                    })
                };

                $scope.retrieveSubcategories();
            }
        }])
}());