(function () {

    "use strict";

    angular.module('petModeAdminApp')
        .controller('AdminShopCategoriesController', ['$sce', '$scope', '$state', 'ngDialog', 'ShopCategoriesFactory', '$stateParams', '$rootScope',
            function ($sce, $scope, $state, ngDialog, categories, $stateParams, $rootScope) {
            $rootScope.$state = $state;


            if($state.current.name == 'create_shop_category' || $state.current.name == 'edit_shop_category'){

                if($state.current.name == 'create_shop_category'){
                    $scope.category = {};
                }

                if($state.current.name == 'edit_shop_category'){
                    categories.show($stateParams.id)
                        .success(function(data){
                            $scope.category = data.category;
                        })
                }

                $scope.submitted = false;

                $scope.upsertCategory = function(){
                    $scope.submited = true;
                    if($scope.categoryForm.$invalid ){
                        return false;
                    }

                    $scope.processing = true;
                    categories.upsert($scope.category)
                        .success(function(){
                            $scope.processing = false;
                            ngDialog.open({
                                className: 'ngdialog-theme-default',
                                template: I18n.t('category.messages.success_upsert'),
                                plain: true
                            });
                            $state.go('shop_categories')
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

                $scope.goToSubcategories = function(){
                    $state.go('shop_subcategories', {category_id: $stateParams.id})
                }
            }

            if($state.current.name == 'shop_categories'){
                $scope.categories = [];

                $scope.page = 1;
                $scope.retrieveCategories = function(){
                    categories.all({page: $scope.page}).success(function (data) {
                        $scope.categories = data.categories;
                        $scope.count = data.count;

                        var pagination = $('#categories-pagination');
                        pagination.empty();
                        pagination.removeData('twbs-pagination');
                        pagination.unbind('page');

                        if($scope.count == 0){
                            return
                        }

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
                    var scope = $scope;
                    ngDialog.open({
                        className: 'ngdialog-theme-default',
                        template: 'client_app/templates/admin/shop_categories/confirm_removing.html',
                        controller: ['$scope', function ($scope) {
                            $scope.I18n = I18n;
                            $scope.destroy = function () {
                                categories.destroy(id).success(function(){
                                    $scope.closeThisDialog();
                                    scope.retrieveCategories();
                                });
                            };
                        }]
                    });
                };

                $scope.retrieveCategories();
            }
        }])
}());