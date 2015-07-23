(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('SettingsController', ['$sce', '$scope', '$state', 'ngDialog', 'UsersFactory', function ($sce, $scope, $state, ngDialog, users) {
            users.my_info().success(function(data){
                $scope.my_info = data.user;
            });

            $scope.processing = true;
            $scope.updateProfile = function(){
                users.updateProfile($scope.my_info, $scope.user_avatar)
                    .success(function(data){
                        $scope.processing = false;
                        ngDialog.open({
                            className: 'ngdialog-theme-default',
                            template: "Profile successfully updated.",
                            plain: true
                        });
                    }).error(function(data){
                        $scope.processing = false;
                        // TODO dispaly validations
                    })
            }
        }])
}());