(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('FriendsController', ['$sce', '$scope', '$state', 'ngDialog', 'UsersFactory', '$timeout', 'FriendsFactory',
            function ($sce, $scope, $state, ngDialog, users, $timeout, friends) {

                $scope.users_page = 1;
                $scope.pending_friends_page = 1;
                $scope.requested_friends_page = 1;
                $scope.friends_page = 1;
                var timer = false;
                var timer2 = false;
                var timer3 = false;
                var timer4 = false;
                $scope.query = '';

                $scope.retrieveUsers = function(){
                    if(timer){
                        $timeout.cancel(timer)
                    }
                    timer = $timeout(function(){

                        users.all({page: $scope.users_page, query: $scope.query}).success(function (data) {
                            $scope.users = data.users;
                            $scope.users_count = data.count;

                            var pagination = $('#users-pagination');
                            pagination.empty();
                            pagination.removeData('twbs-pagination');
                            pagination.unbind('page');

                            if($scope.users_count > 10){
                                pagination.twbsPagination({
                                    totalPages: Math.ceil($scope.users_count / 10),
                                    startPage: $scope.users_page,
                                    visiblePages: 13,
                                    onPageClick: function (event, page) {
                                        $scope.users_page = page;
                                        $scope.retrieveUsers();
                                    }
                                });
                            }
                        }).error(function (data) {

                        });
                    }, 500);
                };

                $scope.retrieveUsers();

                $scope.retrieveFriends = function(){
                    if(timer2){
                        $timeout.cancel(timer2)
                    }
                    timer2 = $timeout(function(){

                        users.friends({page: $scope.friends_page, query: $scope.query}).success(function (data) {
                            $scope.friends = data.friends;
                            $scope.friends_count = data.count;

                            var pagination = $('#friends-pagination');
                            pagination.empty();
                            pagination.removeData('twbs-pagination');
                            pagination.unbind('page');

                            if($scope.friends_count > 10){
                                pagination.twbsPagination({
                                    totalPages: Math.ceil($scope.friends_count / 10),
                                    startPage: $scope.friends_page,
                                    visiblePages: 13,
                                    onPageClick: function (event, page) {
                                        $scope.friends_page = page;
                                        $scope.retrieveFriends();
                                    }
                                });
                            }
                        }).error(function (data) {

                        });
                    }, 500);
                };

                $scope.retrieveFriends();

                $scope.retrievePendingFriends = function(){
                    if(timer3){
                        $timeout.cancel(timer3)
                    }
                    timer3 = $timeout(function(){

                        users.pending_friends({page: $scope.pending_friends_page, query: $scope.query}).success(function (data) {
                            $scope.pending_friends = data.pending_friends;
                            $scope.pending_friends_count = data.count;

                            var pagination = $('#pending-users-pagination');
                            pagination.empty();
                            pagination.removeData('twbs-pagination');
                            pagination.unbind('page');

                            if($scope.pending_friends_count > 10){
                                pagination.twbsPagination({
                                    totalPages: Math.ceil($scope.pending_friends_count / 10),
                                    startPage: $scope.pending_friends_page,
                                    visiblePages: 13,
                                    onPageClick: function (event, page) {
                                        $scope.pending_friends_page = page;
                                        $scope.retrievePendingFriends();
                                    }
                                });
                            }
                        }).error(function (data) {

                        });
                    }, 500);
                };

                $scope.retrievePendingFriends();

                $scope.retrieveRequestedFriends = function(){
                    if(timer4){
                        $timeout.cancel(timer4)
                    }
                    timer4 = $timeout(function(){

                        users.requested_friends({page: $scope.requested_friends_page, query: $scope.query}).success(function (data) {
                            $scope.requested_friends = data.requested_friends;
                            $scope.requested_friends_count = data.count;

                            var pagination = $('#pending-users-pagination');
                            pagination.empty();
                            pagination.removeData('twbs-pagination');
                            pagination.unbind('page');

                            if($scope.requested_friends_count > 10){
                                pagination.twbsPagination({
                                    totalPages: Math.ceil($scope.requested_friends_count / 10),
                                    startPage: $scope.requested_friends_page,
                                    visiblePages: 13,
                                    onPageClick: function (event, page) {
                                        $scope.requested_friends_page = page;
                                        $scope.retrieveRequestedFriends();
                                    }
                                });
                            }
                        }).error(function (data) {

                        });
                    }, 500);
                };

                $scope.retrieveRequestedFriends();


                $scope.updateAll = function(){
                    $scope.users_page = 1;
                    $scope.pending_friends_page = 1;
                    $scope.requested_friends_page = 1;
                    $scope.friends_page = 1;
                    $scope.retrieveUsers();
                    $scope.retrieveFriends();
                    $scope.retrievePendingFriends();
                    $scope.retrieveRequestedFriends();
                };

                $scope.$watch('query', function(){
                    $scope.updateAll();
                });

                $scope.addToFriends = function(id){
                    friends.create(id)
                        .success(function(data){
                            $scope.updateAll();
                            ngDialog.open({
                                className: 'ngdialog-theme-default',
                                template: data.message,
                                plain: true
                            });
                        })
                        .error(function(data){
                            ngDialog.open({
                                className: 'ngdialog-theme-default',
                                template: data.message,
                                plain: true
                            });
                        })
                };

                $scope.declineInviteToFriends = function(id){
                    friends.cancel(id)
                        .success(function(data){
                            $scope.updateAll();
                            ngDialog.open({
                                className: 'ngdialog-theme-default',
                                template: data.message,
                                plain: true
                            });
                        })
                        .error(function(data){
                            ngDialog.open({
                                className: 'ngdialog-theme-default',
                                template: data.message,
                                plain: true
                            });
                        })
                };

                $scope.acceptInviteToFriends = function(id){
                    friends.accept(id)
                        .success(function(data){
                            $scope.updateAll();
                            ngDialog.open({
                                className: 'ngdialog-theme-default',
                                template: data.message,
                                plain: true
                            });
                        })
                        .error(function(data){
                            ngDialog.open({
                                className: 'ngdialog-theme-default',
                                template: data.message,
                                plain: true
                            });
                        })
                };

                $scope.rejectInviteToFriends = function(id){
                    friends.decline(id)
                        .success(function(data){
                            $scope.updateAll();
                            ngDialog.open({
                                className: 'ngdialog-theme-default',
                                template: data.message,
                                plain: true
                            });
                        })
                        .error(function(data){
                            ngDialog.open({
                                className: 'ngdialog-theme-default',
                                template: data.message,
                                plain: true
                            });
                        })
                };

                $scope.removeFromFriends = function(id){
                    friends.remove(id)
                        .success(function(data){
                            $scope.updateAll();
                            ngDialog.open({
                                className: 'ngdialog-theme-default',
                                template: data.message,
                                plain: true
                            });
                        })
                        .error(function(data){
                            ngDialog.open({
                                className: 'ngdialog-theme-default',
                                template: data.message,
                                plain: true
                            });
                        })
                }
        }])
}());