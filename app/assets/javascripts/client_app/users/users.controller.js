(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('UsersController', ['$scope', '$state', 'ngDialog', function ($scope, $state, ngDialog) {
            $scope.userData = {};
            $scope.submited = false;

            $scope.submitUserData = function () {
                $scope.submited = true;
                if($scope.userForm.$invalid){
                    return false;
                }
                //
                //$loading.start('setup');
                //isup.submitUserData($scope.userData).success(function(data, status, headers, config){
                //    $state.go('setup.' + (data.setup_state.next_step));
                //    $loading.finish('setup');
                //}).error(function (data, status, headers, config) {
                //    $loading.finish('setup');
                //    if(data.errors){
                //        hbDialog.showAlert('Error', JSON.stringify(data.errors));
                //    }
                //    if (status == 403){
                //        $state.go('setup.' + (data.setup_state.next_step));
                //    }else{
                //        $scope.errors = data.validation_errors;
                //    }
                //});


            };
        }])
}());