(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('CopulationController', ['$scope', '$state', 'ngDialog', function ($scope, $state, ngDialog) {
            $scope.I18n = I18n;
            console.log(I18n.t('copulation.dog.age'));
            if($state.current.name == 'new_copulation'){
                $scope.announcement = {};
            }
        }])
}());