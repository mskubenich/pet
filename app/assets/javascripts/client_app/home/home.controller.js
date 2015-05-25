(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('HomeController', ['$scope', '$state', 'ngDialog', 'SessionsFactory', function ($scope, $state, ngDialog, session) {

            $scope.closeDialog = function(){
                ngDialog.close();
            };

            $scope.getCurrentUserInfo = function(){
                session.currentUser().success(function(data){
                    $scope.current_user = data.current_user;
                })
            };
            $scope.getCurrentUserInfo();

            $scope.showLoginForm = function(){
                ngDialog.open({
                    className: 'ngdialog-theme-default',
                    scope: $scope,
                    template: 'client_app/templates/sessions/new.html',
                    controller: ['$scope', '$rootScope', function($scope, $rootScope) {
                        $scope.session = {};

                        $scope.login = function(){
                            session.create($scope.session)
                                .success(function(){
                                    console.log('here');
                                    $scope.closeThisDialog();
                                })
                                .error(function(data){
                                    $scope.error = data.error;
                                })
                        };
                    }]
                });
            }

        }])
}());