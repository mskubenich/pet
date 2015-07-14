(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('SettingsController', ['$sce', '$scope', '$state', 'ngDialog', function ($sce, $scope, $state, ngDialog) {
            $scope.where = 'on settings page'
        }])
}());