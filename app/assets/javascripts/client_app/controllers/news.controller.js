(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('NewsController', ['$scope', '$state', 'ngDialog', 'NewsFactory', '$sce', '$stateParams', function ($scope, $state, ngDialog, news, $sce, $stateParams) {

            $scope.$parent.header_url = 'client_app/templates/layouts/yellow-header.html';

            if($state.current.name == 'show_news'){
                $scope.news = {};

                news.show($stateParams.id).success(function(data){
                    $scope.news = data.news;
                })

            }

            if($state.current.name == 'news'){

                $scope.filters = {categories: {}};

                news.categories().success(function(data){
                    $scope.categories = data.categories;
                });

                $scope.news = [];

                $scope.page = 1;
                $scope.retrieveNews = function(){
                    news.all({page: $scope.page, filters: $scope.filters}).success(function (data) {
                        $scope.news = data.news;
                        $scope.news_count = data.news_count;

                        var pagination = $('#news-pagination');
                        pagination.empty();
                        pagination.removeData('twbs-pagination');
                        pagination.unbind('page');

                        pagination.twbsPagination({
                            totalPages: Math.ceil($scope.news_count / 10),
                            startPage: $scope.page,
                            visiblePages: 9,
                            onPageClick: function (event, page) {
                                $scope.page = page;
                                $scope.retrieveNews();
                            }
                        });
                    }).error(function (data) {

                    });
                };

                $scope.retrieveNews();

                $scope.$watch('filters', function(){
                    $scope.retrieveNews();
                }, true);
            }

            $scope.getHtml = function(html){
                return $sce.trustAsHtml(html);
            };
        }])
}());