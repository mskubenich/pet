(function () {

    "use strict";

    angular.module('petModeAdminApp')
        .controller('AdminOrdersController', ['$scope', '$state', 'ngDialog', 'OrdersFactory', '$stateParams', function ($scope, $state, ngDialog, orders, $stateParams) {

            if($state.current.name == 'orders'){
                $scope.orders = [];

                $scope.page = 1;
                $scope.retrieveOrders = function(){
                    orders.all({page: $scope.page})
                        .success(function (data) {
                            $scope.orders = data.orders;
                            $scope.count = data.count;

                            var pagination = $('#orders-pagination');
                            pagination.empty();
                            pagination.removeData('twbs-pagination');
                            pagination.unbind('page');

                            pagination.twbsPagination({
                                totalPages: Math.ceil($scope.count / 10),
                                startPage: $scope.page,
                                visiblePages: 9,
                                onPageClick: function (event, page) {
                                    $scope.page = page;
                                    $scope.retrieveOrders();
                                }
                            });
                        })
                        .error(function (data) {

                        });
                };

                $scope.retrieveOrders();

                $scope.removeUser = function(id){
                    var scope = $scope;
                    ngDialog.open({
                        className: 'ngdialog-theme-default',
                        template: 'client_app/templates/admin/users/confirm_removing.html',
                        controller: ['$scope', function ($scope) {
                            $scope.I18n = I18n;
                            $scope.destroy = function () {
                                users.remove(id).success(function(){
                                    $scope.closeThisDialog();
                                    scope.retrieveUsers();
                                });
                            };
                        }]
                    });
                };
            }

            if($state.current.name == 'order'){

            }
        }])
}());