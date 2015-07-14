(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('PostsController', ['$sce', '$scope', '$state', 'ngDialog', function ($sce, $scope, $state, ngDialog) {
            $scope.where = 'on posts page'
        }])
}());