(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('CopulationController', ['$scope', '$state', 'ngDialog',
            function ($scope, $state, ngDialog) {
            $scope.I18n = I18n;

            if($state.current.name == 'new_copulation'){
                $scope.$parent.header_url = 'client_app/templates/layouts/black-header.html';
                $scope.announcement = {};
            }
        }])
}());