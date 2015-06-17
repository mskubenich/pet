(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('ProfileController', ['$scope', '$state', 'ngDialog', 'UsersFactory', '$sce', '$stateParams', function ($scope, $state, ngDialog, users, $sce, $stateParams) {

            $scope.$parent.header_url = 'client_app/templates/layouts/black-header.html';

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
            }

        }])
}());