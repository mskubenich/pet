(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('MyPetsController', ['$sce', '$scope', '$state', 'ngDialog', 'BreedsFactory', 'MyPetsFactory', '$stateParams',
            function ($sce, $scope, $state, ngDialog, breeds, pets, $stateParams) {

                if($state.current.name == 'new_my_pet' || $state.current.name == 'edit_my_pet'){

                    $scope._ = _;
                    $scope.breeds = [];
                    $scope.petData = {};
                    $scope.$state = $state;

                    if($state.current.name == 'new_my_pet'){

                    }else if($state.current.name == 'edit_my_pet'){
                        pets.show($stateParams.id)
                            .success(function(data){
                                $scope.petData = data.pet;
                            })
                    }

                    $scope.updateBreeds = function(){
                        breeds.all({family: $scope.petData.family})
                            .success(function(data){
                                $scope.breeds = data.breeds;
                                if(!_.contains(_.map($scope.breeds, function(breed){ return breed.id }), $scope.petData.breed_id)){
                                    $scope.petData.breed_id = null;
                                }
                            })
                            .error(function(){

                            })
                    };
                    $scope.updateBreeds();

                    $scope.$watch('petData.family', function(){
                        $scope.updateBreeds();
                    });

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


                    $scope.submitPetData = function(){
                        if($scope.petForm.$invalid){
                            return false;
                        }
                        $scope.processing = true;

                        pets.upsert($scope.petData, $scope.attachments, $scope.removed_attachments_previews)
                            .success(function(){
                                $scope.processing = false;
                                ngDialog.open({
                                    className: 'ngdialog-theme-default',
                                    template: "Pet successfully saved.",
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
                    }
                }

                if($state.current.name == 'my-pets'){
                    $scope.retrievePets = function(){
                        pets.all()
                            .success(function(data){
                                $scope.pets = data.pets;
                            })
                            .error(function(){})
                    };
                    $scope.retrievePets();

                    $scope.removePet = function(id){
                        pets.destroy(id).success(function(){
                            $scope.retrievePets();
                        })
                    }
                }
        }])
}());