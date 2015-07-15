(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('FriendsController', ['$sce', '$scope', '$state', 'ngDialog', 'UsersFactory', '$timeout',
            function ($sce, $scope, $state, ngDialog, users, $timeout) {

                $scope.page = 1;
                var timer = false;
                $scope.query = '';

                $scope.retrieveUsers = function(){
                    if(timer){
                        $timeout.cancel(timer)
                    }
                    timer = $timeout(function(){

                        users.all({page: $scope.page, query: $scope.query}).success(function (data) {
                            $scope.users = data.users;
                            $scope.count = data.count;

                            var pagination = $('#users-pagination');
                            pagination.empty();
                            pagination.removeData('twbs-pagination');
                            pagination.unbind('page');

                            if($scope.count > 10){
                                pagination.twbsPagination({
                                    totalPages: Math.ceil($scope.count / 10),
                                    startPage: $scope.page,
                                    visiblePages: 13,
                                    onPageClick: function (event, page) {
                                        $scope.page = page;
                                        $scope.retrieveUsers();
                                    }
                                });
                            }
                        }).error(function (data) {

                        });
                    }, 500);
                };

                $scope.retrieveUsers();

                $scope.addToFriends(id)
                    .success(function(){

                    })
                    .error(function(){

                    })
        }])
}());