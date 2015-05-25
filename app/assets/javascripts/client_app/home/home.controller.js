(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('HomeController', ['$scope', '$state', 'ngDialog', function ($scope, $state, ngDialog) {

            $scope.closeDialog = function(){
                ngDialog.close();
            };
            
            $scope.getCurrentUserInfo = function(){

            };

            $scope.showLoginForm = function(){
                ngDialog.open({
                    className: 'ngdialog-theme-default',
                    scope: $scope,
                    template: 'client_app/templates/sessions/new.html',
                    controller: ['$scope', '$rootScope', 'SessionsFactory', function($scope, $rootScope, session) {
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