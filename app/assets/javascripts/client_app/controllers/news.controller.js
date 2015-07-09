(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('NewsController', ['$scope', '$state', 'ngDialog', 'NewsFactory', '$sce', '$stateParams', 'CommentsFactory',
            function ($scope, $state, ngDialog, news, $sce, $stateParams, comments) {

            if($state.current.name == 'show_news'){
                $scope.$parent.header_url = 'client_app/templates/layouts/yellow-header.html';
                $scope.news = {};

                news.show($stateParams.id).success(function(data){
                    $scope.news = data.news;
                });

                $scope.comments_page = 1;
                $scope.retrieveComments = function(){
                    comments.all({page: $scope.comments_page, entity_type: 'News', entity_id: $stateParams.id}).success(function (data) {
                        $scope.comments = data.comments;
                        $scope.count = data.count;

                        var pagination = $('#comments-pagination');
                        pagination.empty();
                        pagination.removeData('twbs-pagination');
                        pagination.unbind('page');

                        pagination.twbsPagination({
                            totalPages: Math.ceil($scope.count / 10),
                            startPage: $scope.comments_page,
                            visiblePages: 9,
                            onPageClick: function (event, page) {
                                $scope.comments_page = page;
                                $scope.retrieveComments();
                            }
                        });
                    }).error(function (data) {

                    });
                };

                $scope.retrieveComments();

                $scope.rate = 4;
                $scope.max = 5;
                $scope.isReadonly = true;

                $scope.hoveringOver = function(value) {
                    $scope.overStar = value;
                    $scope.percent = 100 * (value / $scope.max);
                };

                $scope.new_comment = '';
                $scope.comment = function(){
                    if($scope.new_comment.toString().trim() != ''){
                        comments.create({text: $scope.new_comment, entity_id: $stateParams.id, entity_type: 'News'}).success(function(){
                            $scope.new_comment = '';
                            $scope.retrieveComments();
                        })
                    }
                }
            }

            if($state.current.name == 'news'){
                $scope.$parent.header_url = 'client_app/templates/layouts/yellow-header.html';

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