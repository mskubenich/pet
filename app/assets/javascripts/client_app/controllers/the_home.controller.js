(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('TheHomeController', ['$scope', '$state', 'ngDialog', 'SessionsFactory', 'PagesFactory', '$timeout', '$sce',
            function ($scope, $state, ngDialog, session, pages, $timeout, $sce) {

                $scope.$parent.header_url = 'yellow';
                $('body').css('background-color', 'white');
                $scope.I18n = I18n;
                $scope.closeDialog = function(){
                    ngDialog.close();
                };

                $scope.$parent.header_url = 'yellow';
                $scope.header_url = 'yellow';

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

                pages.news()
                    .success(function(data){
                        $scope.popular_news = data.news;
                    })
                    .error();

                $scope.$parent.initShopSlides();


                $scope.initTheCopulationSlider = function(){
                    pages.get_the_copulation_slides()
                        .success(function(data){
                            $scope.the_copulation_slides = data.slides;
                            $timeout(function() {
                                console.log('here');
                                $('.the-copulation-slider').on('init', function(){
                                    $('.the-copulation-slider').show();
                                    $(window).resize();
                                });
                                $scope.theCopulationSlider = $('.the-copulation-slider').slick({
                                    dots: false,
                                    infinite: true,
                                    speed: 700,
                                    autoplay: true,
                                    arrows: false,
                                    fade: true,
                                    autoplaySpeed: 1000
                                });
                            }, 0);
                        })
                        .error();
                };
                $scope.initTheCopulationSlider();

                $scope.slides = [];
                pages.get_slides()
                    .success(function(data){
                        $scope.slides = data.images;
                        $timeout(function() {
                            $('#copulaton-carousel').on('init', function(){
                                $('#copulaton-carousel').css('display', 'block')
                            });
                            $('#copulaton-carousel').slick({
                                dots: false,
                                infinite: true,
                                speed: 300,
                                slidesToShow: 12,
                                slidesToScroll: 11,
                                autoplay: true,
                                arrows: true,
                                prevArrow: "<button class='gallery-prev'><i class='fa fa-caret-left'</button>",
                                nextArrow: "<button class='gallery-next'><i class='fa fa-caret-right'</button>",
                                responsive: [
                                    {
                                        breakpoint: 2000,
                                        settings: {
                                            slidesToShow: 8,
                                            slidesToScroll: 7
                                        }
                                    },
                                    {
                                        breakpoint: 1750,
                                        settings: {
                                            slidesToShow: 6,
                                            slidesToScroll: 7
                                        }
                                    },
                                    {
                                        breakpoint: 1300,
                                        settings: {
                                            slidesToShow: 5,
                                            slidesToScroll: 3
                                        }
                                    },
                                    {
                                        breakpoint: 1150,
                                        settings: {
                                            slidesToShow: 4,
                                            slidesToScroll: 3
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
                    .error(function(){});

            }])
}());