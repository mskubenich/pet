(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('MessagesController', ['$sce', '$scope', '$state', 'ngDialog', function ($sce, $scope, $state, ngDialog) {
            $scope.where = 'on messages page'
        }])
}());