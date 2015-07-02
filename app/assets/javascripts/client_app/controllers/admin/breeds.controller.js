(function () {

    "use strict";

    angular.module('petModeAdminApp')
        .controller('AdminBreedsController', ['$sce', '$scope', '$state', 'ngDialog', 'BreedsFactory', '$stateParams', '$rootScope',
            function ($sce, $scope, $state, ngDialog, breeds, $stateParams, $rootScope) {
            $rootScope.$state = $state;


            if($state.current.name == 'create_breeds' || $state.current.name == 'edit_breeds'){

                if($state.current.name == 'create_breeds'){
                    $scope.breed = {};
                }

                if($state.current.name == 'edit_breeds'){
                    breeds.show($stateParams.id)
                        .success(function(data){
                            $scope.breed = data.breed;
                        })
                }

                $scope.submitted = false;

                $scope.upsertBreed = function(){
                    $scope.submited = true;
                    if($scope.breedForm.$invalid ){
                        return false;
                    }

                    $scope.processing = true;
                    breeds.upsert($scope.breed)
                        .success(function(){
                            $scope.processing = false;
                            ngDialog.open({
                                className: 'ngdialog-theme-default',
                                template: I18n.t('breed.messages.success_upsert'),
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

            if($state.current.name == 'breeds'){
                $scope.breeds = [];

                $scope.page = 1;
                $scope.retrieveBreeds = function(){
                    breeds.all({page: $scope.page}).success(function (data) {
                        $scope.breeds = data.breeds;
                        $scope.count = data.count;

                        var pagination = $('#breeds-pagination');
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
                    breeds.destroy(id).success(function(){
                        $scope.retrieveBreeds();
                    })
                };

                $scope.retrieveBreeds();
            }
        }])
}());