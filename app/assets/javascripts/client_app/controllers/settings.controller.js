(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('SettingsController', ['$sce', '$scope', '$state', 'ngDialog', 'UsersFactory', 'CountriesFactory',
            function ($sce, $scope, $state, ngDialog, users, countries) {

                $scope.getMyInfo = function(){
                    users.my_info().success(function(data){
                        $scope.my_info = data.user;
                    });
                };

                $scope.getMyInfo();

                countries.all().success(function(data){
                    $scope.countries = data.countries;
                });

                $scope.processing = true;
                $scope.updateProfile = function(){
                    users.updateProfile($scope.my_info, $scope.user_avatar)
                        .success(function(data){
                            $scope.processing = false;
                            ngDialog.open({
                                className: 'ngdialog-theme-default',
                                template: I18n.t('users.messages.success_update_profile'),
                                plain: true
                            });
                            $scope.getMyInfo();
                        }).error(function(data){
                            $scope.processing = false;
                            // TODO dispaly validations
                        })
            }
        }])
}());