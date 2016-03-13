(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('UsersController', ['$scope', '$state', 'ngDialog', 'UsersFactory', '$stateParams', 'FriendsFactory', 'PostsFactory', 'MyPetsFactory', 'CountriesFactory',
            function ($scope, $state, ngDialog, users, $stateParams, friends, posts, pets, countries) {
            $scope.userData = {};
            $scope.submited = false;

            $('body').css('background-color', 'white');

            if($state.current.name == 'registration'){
                $scope.$parent.header_url = 'yellow';

                countries.all().success(function(data){
                    $scope.countries = data.countries;
                });

                $scope.submitUserData = function () {
                    $scope.submited = true;

                    if($scope.userForm.$invalid ){
                        console.log($scope.userForm);
                        return false;
                    }

                    users.create($scope.userData)
                        .success(function(data, status, headers, config){
                            if($scope.user_avatar){
                                users.uploadAvatar($scope.user_avatar);
                            }
                            $state.go('home');
                            ngDialog.open({
                                className: 'ngdialog-theme-default',
                                template: I18n.t('sessions.success_login'),
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
            if($state.current.name == 'user'){

                $scope.retrievePosts = function(){
                    posts.all($stateParams.id).success(function(data){
                        $scope.posts = data.posts;
                    })
                };
                $scope.retrievePosts();

                pets.all($stateParams.id)
                    .success(function(data){
                        $scope.pets = data.pets;
                    })
                    .error(function(){});

                $('body').css('background-color', 'white');
                $scope.$parent.header_url = 'black';
                $scope.$state = $state;

                $scope.rate = 4;
                $scope.max = 5;
                $scope.isReadonly = true;

                $scope.hoveringOver = function(value) {
                    $scope.overStar = value;
                    $scope.percent = 100 * (value / $scope.max);
                };

                $scope.updateAll = function(){
                    users.show($stateParams.id)
                        .success(function(data){
                            $scope.profile = data.profile;
                            $scope.phone = $scope.profile.phone_hashed;
                        })
                        .error();
                };

                $scope.showPhone = function(){
                    $scope.phone = $scope.profile.phone;
                };
                $scope.updateAll();

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
            }
        }])
}());