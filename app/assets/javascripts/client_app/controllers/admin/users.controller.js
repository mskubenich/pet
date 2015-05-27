(function () {

    "use strict";

    angular.module('petModeAdminApp')
        .controller('AdminUsersController', ['$scope', '$state', 'ngDialog', 'UsersFactory', function ($scope, $state, ngDialog, users) {
            $scope.users = [];

            users.all()
                .success(function(data){
                    $scope.users = data.users;
                })
                .error(function(){

                })
        }])
}());