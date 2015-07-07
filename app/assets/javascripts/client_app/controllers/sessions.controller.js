(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('SessionsController', ['$scope', '$state', 'ngDialog', 'SessionsFactory', function ($scope, $state, ngDialog, session) {
            $scope.session = {};

            $('body').css('background-color', 'white');
            $scope.login = function(){
                session.create($scope.session)
                    .success(function(){
                        $state.go('home');
                        $scope.getCurrentUserInfo();
                    })
                    .error(function(data){
                        $scope.error = data.error;
                    })
            };
        }])
}());