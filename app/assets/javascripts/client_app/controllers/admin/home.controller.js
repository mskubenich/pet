(function () {

    "use strict";

    angular.module('petModeAdminApp')
        .controller('AdminHomeController', ['$scope', '$state', 'ngDialog', function ($scope, $state, ngDialog, session) {
            $scope.I18n = I18n;
        }])
}());