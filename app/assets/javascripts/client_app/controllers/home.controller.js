(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('HomeController', ['$scope', '$state', 'ngDialog', 'SessionsFactory', 'PagesFactory', '$timeout', '$sce',
            function ($scope, $state, ngDialog, session, pages, $timeout, $sce) {
            $scope.I18n = I18n;
            $scope.closeDialog = function(){
                ngDialog.close();
            };

            $scope.getCurrentUserInfo = function(){
                session.currentUser().success(function(data){
                    $scope.current_user = data.current_user;
                })
            };
            $scope.getCurrentUserInfo();

            $scope.showLoginForm = function(){
                ngDialog.open({
                    className: 'ngdialog-theme-default',
                    scope: $scope,
                    template: 'client_app/templates/sessions/new.html',
                    controller: ['$scope', '$rootScope', function($scope, $rootScope) {
                        $scope.session = {};

                        $scope.login = function(){
                            session.create($scope.session)
                                .success(function(){
                                    $scope.closeThisDialog();
                                    $scope.getCurrentUserInfo();
                                })
                                .error(function(data){
                                    $scope.error = data.error;
                                })
                        };
                    }]
                });
            };

            $scope.logout = function(){
                session.destroy()
                    .success(function(){
                        $scope.current_user = null;
                        $state.go('home');
                    })
                    .error(function(data){

                    })
            };

            $scope.header_url = 'client_app/templates/layouts/yellow-header.html';

            $scope.getHtml = function(html){
                return $sce.trustAsHtml(html);
            };

            pages.get_sale_slides()
                .success(function(data){
                    $scope.sale_slides = data.sale_slides;
                })
                .error();

            pages.get_copulation_slides()
                .success(function(data){
                    $scope.copulation_slides = data.copulation_slides;
                })
                .error();

            pages.news({page: 1})
                .success(function(data){
                    $scope.news = [data.news[0], data.news[1]];
                })
                .error();

            pages.get_shop_slides()
                .success(function(data){
                    $scope.shop_slides = data.slides;
                    $timeout(function() {
                        $('#shop-carousel').slick({
                            dots: false,
                            infinite: true,
                            speed: 300,
                            slidesToShow: 6,
                            slidesToScroll: 5,
                            autoplay: true,
                            arrows: true,
                            prevArrow: "<button class='gallery-prev'><i class='fa fa-caret-left'</button>",
                            nextArrow: "<button class='gallery-next'><i class='fa fa-caret-right'</button>",
                            responsive: [
                                {
                                    breakpoint: 1024,
                                    settings: {
                                        slidesToShow: 6,
                                        slidesToScroll: 3,
                                        infinite: true,
                                        dots: true
                                    }
                                },
                                {
                                    breakpoint: 600,
                                    settings: {
                                        slidesToShow: 4,
                                        slidesToScroll: 2
                                    }
                                },
                                {
                                    breakpoint: 480,
                                    settings: {
                                        slidesToShow: 2,
                                        slidesToScroll: 1
                                    }
                                }
                            ]
                        });
                    }, 1000);
                })
                .error();

            $scope.slides = [];
            pages.get_slides()
                .success(function(data){
                    $scope.slides = data.images;
                    $timeout(function() {
                        $('#copulaton-carousel').slick({
                            dots: false,
                            infinite: true,
                            speed: 300,
                            slidesToShow: 6,
                            slidesToScroll: 5,
                            autoplay: true,
                            arrows: true,
                            prevArrow: "<button class='gallery-prev'><i class='fa fa-caret-left'</button>",
                            nextArrow: "<button class='gallery-next'><i class='fa fa-caret-right'</button>",
                            responsive: [
                                {
                                    breakpoint: 1024,
                                    settings: {
                                        slidesToShow: 6,
                                        slidesToScroll: 3,
                                        infinite: true,
                                        dots: true
                                    }
                                },
                                {
                                    breakpoint: 600,
                                    settings: {
                                        slidesToShow: 4,
                                        slidesToScroll: 2
                                    }
                                },
                                {
                                    breakpoint: 480,
                                    settings: {
                                        slidesToShow: 2,
                                        slidesToScroll: 1
                                    }
                                }
                            ]
                        });
                    }, 1000);
                })
                .error(function(){});

        }])
}());