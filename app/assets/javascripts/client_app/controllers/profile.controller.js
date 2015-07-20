(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('ProfileController', ['$scope', '$state', 'ngDialog', 'UsersFactory', '$sce', '$stateParams', 'MyPetsFactory',
            function ($scope, $state, ngDialog, users, $sce, $stateParams, pets) {

                $('body').css('background-color', 'white');
                $scope.$parent.header_url = 'black';
                $scope.$state = $state;

                $scope.rate = 4;
                $scope.max = 5;
                $scope.isReadonly = true;

                $scope.hoveringOver = function(value) {
                    $scope.overStar = value;
                    $scope.percent = 100 * (value / $scope.max);
                };

                users.profile()
                    .success(function(data){
                        $scope.profile = data.profile;
                        $scope.phone = $scope.profile.phone_hashed;
                    })
                    .error();

                $scope.showPhone = function(){
                    $scope.phone = $scope.profile.phone;
                };

                users.friends_preview().success(function(data){
                    $scope.preview_friends = data.friends;
                }).error();

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
        }])
}());