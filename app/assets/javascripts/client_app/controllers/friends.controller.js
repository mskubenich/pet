(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('FriendsController', ['$sce', '$scope', '$state', 'ngDialog', function ($sce, $scope, $state, ngDialog) {
            $scope.where = 'on friends page'
        }])
}());