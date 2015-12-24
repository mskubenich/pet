(function () {

    "use strict";

    angular.module('petModeAdminApp')
        .controller('AdminNewsCategoriesController', ['$sce', '$scope', '$state', 'ngDialog', 'CategoriesFactory', '$stateParams', '$rootScope',
            function ($sce, $scope, $state, ngDialog, categories, $stateParams, $rootScope) {
            $rootScope.$state = $state;
            $scope.$state = $state;
            $scope.$parent.$state = $state;


            if($state.current.name == 'create_category' || $state.current.name == 'edit_category'){

                if($state.current.name == 'create_category'){
                    $scope.category = {};
                }

                if($state.current.name == 'edit_category'){
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
                            $state.go('news_categories')
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

            if($state.current.name == 'news_categories'){
                $scope.categories = [];

                $scope.page = 1;
                $scope.retrieveCategories = function(){
                    categories.all({page: $scope.page}).success(function (data) {
                        $scope.categories = data.categories;
                        $scope.count = data.count;

                        if($scope.count == 0 ){
                            return
                        }
                        var pagination = $('#categories-pagination');
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
                    categories.destroy(id).success(function(){
                        $scope.retrieveCategories();
                    })
                };

                $scope.retrieveCategories();
            }
        }])
}());