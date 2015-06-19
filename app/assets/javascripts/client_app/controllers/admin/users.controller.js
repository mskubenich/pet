(function () {

    "use strict";

    angular.module('petModeAdminApp')
        .controller('AdminUsersController', ['$scope', '$state', 'ngDialog', 'UsersFactory', '$stateParams', function ($scope, $state, ngDialog, users, $stateParams) {

            if($state.current.name == 'users'){
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
                };

                $scope.banUser = function(user){
                    var scope = $scope;
                    ngDialog.open({
                        className: 'ngdialog-theme-default',
                        template: 'client_app/templates/admin/users/confirm_ban.html',
                        controller: ['$scope', function ($scope) {
                            $scope.I18n = I18n;
                            $scope.ban = function () {
                                users.ban(user.id).success(function(){
                                    user.banned = true;
                                    $scope.closeThisDialog();
                                });
                            };
                        }]
                    });
                };

                $scope.unbanUser = function(user){
                    users.unban(user.id).success(function(){
                        user.banned = false;
                    });
                }
            }

            if($state.current.name == 'edit_user'){
                users.show($stateParams.id).success(function(data){
                    $scope.user = data.user;
                }).error(function(){

                });


                $scope.submitUserData = function () {
                    $scope.submited = true;

                    if($scope.userForm.$invalid ){
                        return false;
                    }

                    users.update($scope.user, $scope.user_avatar)
                        .success(function(data, status, headers, config){
                            ngDialog.open({
                                className: 'ngdialog-theme-default',
                                template: I18n.t('users.messages.success_upsert'),
                                plain: true
                            });
                        })
                        .error(function (data, status, headers, config) {
                            if(data.errors){
                                ngDialog.open({
                                    className: 'ngdialog-theme-default',
                                    template: JSON.stringify(data.errors),
                                    plain: true
                                });
                            }
                        });
                };
            }
        }])
}());