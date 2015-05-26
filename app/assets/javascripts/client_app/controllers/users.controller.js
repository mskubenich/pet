(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('UsersController', ['$scope', '$state', 'ngDialog', 'UsersFactory', function ($scope, $state, ngDialog, users) {
            $scope.userData = {};
            $scope.submited = false;

            $scope.submitUserData = function () {
                $scope.submited = true;

                if($scope.userForm.$invalid && !_.isEqual($scope.userForm.email.$error , {parse: true})){
                    return false;
                }

                users.create($scope.userData)
                    .success(function(data, status, headers, config){
                        $state.go('home');
                        ngDialog.open({
                            className: 'ngdialog-theme-default',
                            template: "Регистрация прошла успешно. Можете войти.",
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