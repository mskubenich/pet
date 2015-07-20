(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('MyPetsController', ['$sce', '$scope', '$state', 'ngDialog', 'BreedsFactory',
            function ($sce, $scope, $state, ngDialog, breeds) {

            $scope._ = _;
            $scope.breeds = [];
            $scope.petData = {};

            $scope.updateBreeds = function(){
                breeds.all({family: $scope.petData.family})
                    .success(function(data){
                        $scope.breeds = data.breeds;

                        if(!_.contains(_.map($scope.breeds, function(breed){ return breed.id }), $scope.petData.breed_id)){
                            $scope.announcement.breed_id = null;
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

        }])
}());