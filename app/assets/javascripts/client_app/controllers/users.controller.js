(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('UsersController', ['$scope', '$state', 'ngDialog', 'UsersFactory', function ($scope, $state, ngDialog, users) {
            $scope.userData = {};
            $scope.submited = false;

            $('body').css('background-color', 'white');
            $scope.$parent.header_url = 'client_app/templates/layouts/yellow-header.html';

            $scope.submitUserData = function () {
                $scope.submited = true;

                if($scope.userForm.$invalid ){
                    return false;
                }

                users.create($scope.userData)
                    .success(function(data, status, headers, config){
                        if($scope.user_avatar){
                            users.uploadAvatar($scope.user_avatar);
                        }
                        $state.go('home');
                        ngDialog.open({
                            className: 'ngdialog-theme-default',
                            template: I18n.t('sessions.success_login'),
                            plain: true
                        });
                    })
                    .error(function (data, status, headers, config) {
                        if(data.errors){
                            ngDialog.open({
                                className: 'ngdialog-theme-default',
                                template: JSON.stringify(data.errors),
                                plain: true
                            });
                        }
                    });
            };
        }])
}());