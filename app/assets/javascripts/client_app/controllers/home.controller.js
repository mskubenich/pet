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

                $scope.logout = function(){
                    session.destroy()
                        .success(function(){
                            $scope.current_user = null;
                            $state.go('home');
                        })
                        .error(function(data){

                        })
                };

                $scope.getHtml = function(html){
                    return $sce.trustAsHtml(html);
                };

                pages.get_main_slides()
                    .success(function(data){
                        $scope.main_slides = data.slides;
                        $timeout(function() {
                            $('.main-slider').on('init', function(){
                                $('.main-slider').show();
                                $(window).resize();
                            });
                            $('.main-slider').slick({
                                dots: false,
                                infinite: true,
                                speed: 700,
                                autoplay: true,
                                arrows: false,
                                fade: true,
                                autoplaySpeed: 10000
                            });
                        }, 0);
                    })
                    .error();

                $scope.initShopSlides = function(){
                    pages.get_shop_slides()
                        .success(function(data){
                            $scope.shop_slides = data.slides;
                            $timeout(function() {
                                $('#shop-carousel').slick({
                                    dots: false,
                                    infinite: true,
                                    speed: 1000,
                                    autoplaySpeed: 6000,
                                    slidesToShow: 6,
                                    slidesToScroll: 1,
                                    autoplay: true,
                                    arrows: true,
                                    prevArrow: "<button class='gallery-prev'><i class='fa fa-caret-left'></i></button>",
                                    nextArrow: "<button class='gallery-next'><i class='fa fa-caret-right'></i></button>",
                                    responsive: [
                                        {
                                            breakpoint: 2500,
                                            settings: {
                                                slidesToShow: 7,
                                                slidesToScroll: 7
                                            }
                                        },
                                        {
                                            breakpoint: 1800,
                                            settings: {
                                                slidesToShow: 5,
                                                slidesToScroll: 3
                                            }
                                        },
                                        {
                                            breakpoint: 1200,
                                            settings: {
                                                slidesToShow: 4,
                                                slidesToScroll: 2
                                            }
                                        },
                                        {
                                            breakpoint: 800,
                                            settings: {
                                                slidesToShow: 3,
                                                slidesToScroll: 2
                                            }
                                        },
                                        {
                                            breakpoint: 550,
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
                };

                $scope.selectizeCountry = function(){
                    var autocomplete = new google.maps.places.Autocomplete(document.getElementById('select-country'), {
                        language: 'ru',
                        componentRestrictions: {country: 'ua'}
                    });

                    $('#select-country').parents('.dropdown-menu').click(function(e) {
                        e.stopPropagation();
                    });
                };

                $scope.selectizeCity = function(){
                    var autocomplete = new google.maps.places.Autocomplete(document.getElementById('select-country'), {
                        language: 'ru',
                        componentRestrictions: {country: 'ua'}
                    });

                    $('#select-country').parents('.dropdown-menu').click(function(e) {
                        e.stopPropagation();
                    });
                }
        }])
}());