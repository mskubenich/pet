(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('UsersController', ['$scope', '$state', 'ngDialog', function ($scope, $state, ngDialog) {
            $scope.dulo = 'users dulo';

            //$scope.userData = {
            //    first_name: '',
            //    last_name: '',
            //    ssn_capture: '',
            //    phone_number: '',
            //    adress: '',
            //    date_of_birth: null
            //};
            //
            //$scope.submitUserData = function () {
            //    if($scope.userDataForm.$invalid){
            //        return false;
            //    }
            //
            //    $loading.start('setup');
            //    isup.submitUserData($scope.userData).success(function(data, status, headers, config){
            //        $state.go('setup.' + (data.setup_state.next_step));
            //        $loading.finish('setup');
            //    }).error(function (data, status, headers, config) {
            //        $loading.finish('setup');
            //        if(data.errors){
            //            hbDialog.showAlert('Error', JSON.stringify(data.errors));
            //        }
            //        if (status == 403){
            //            $state.go('setup.' + (data.setup_state.next_step));
            //        }else{
            //            $scope.errors = data.validation_errors;
            //        }
            //    });
            //};
            //
            //$scope.stepData = {};
            //stepDataService.getStepData(function(data){
            //    $scope.userData = data.step_data;
            //});
        }])

}());