(function () {

    "use strict";

    angular.module('petModeAdminApp')
        .controller('AdminUsersController', ['$scope', '$state', 'ngDialog', 'UsersFactory', function ($scope, $state, ngDialog, users) {
            $scope.users = [];

            $scope.page = 1;
            $scope.retrieveUsers = function(){
                users.all({page: $scope.page})
                    .success(function (data) {
                        $scope.users = data.users;
                        $scope.count = data.count;

                        var pagination = $('#users-pagination');
                        pagination.empty();
                        pagination.removeData('twbs-pagination');
                        pagination.unbind('page');

                        pagination.twbsPagination({
                            totalPages: Math.ceil($scope.count / 10),
                            startPage: $scope.page,
                            visiblePages: 9,
                            onPageClick: function (event, page) {
                                $scope.page = page;
                                $scope.retrieveUsers();
                            }
                        });
                    })
                    .error(function (data) {

                    });
            };

            $scope.retrieveUsers();

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
            }
        }])
}());