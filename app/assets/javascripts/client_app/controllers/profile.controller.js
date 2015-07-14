(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('ProfileController', ['$scope', '$state', 'ngDialog', 'UsersFactory', '$sce', '$stateParams', function ($scope, $state, ngDialog, users, $sce, $stateParams) {

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
        }])
}());