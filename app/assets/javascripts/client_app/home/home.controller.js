(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('HomeController', ['$scope', '$state', 'ngDialog', function ($scope, $state, ngDialog) {

            $scope.showLoginForm = function(){
                ngDialog.open({ template: 'client_app/templates/sessions/new.html' });
            }
        }])
}());