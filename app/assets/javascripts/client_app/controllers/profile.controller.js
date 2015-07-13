(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('ProfileController', ['$scope', '$state', 'ngDialog', 'UsersFactory', '$sce', '$stateParams', function ($scope, $state, ngDialog, users, $sce, $stateParams) {

            $('body').css('background-color', 'white');
            $scope.$parent.header_url = 'black';

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

            $scope.articles = [
                {title: 'Lorem ipsum dolor sit amet', scorp: true, created_at: "около 23 часов назад в 18:19", author: 'dog_sale', body: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'},
                {title: 'Lorem ipsum dolor ',created_at: "около 23 часов назад в 18:19", author: 'dog_sale', body: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'},
                {title: 'Lorem ipsum dolor sit amet',created_at: "около 23 часов назад в 18:19", author: 'dog_sale', body: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in.'}
            ];

        }])
}());