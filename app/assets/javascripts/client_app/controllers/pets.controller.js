(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('MyPetsController', ['$sce', '$scope', '$state', 'ngDialog', function ($sce, $scope, $state, ngDialog) {
            $scope.where = 'on my pets page'
        }])
}());