(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('ExhibitionsController', ['$scope', '$state', 'ngDialog', 'ExhibitionsFactory', '$sce', '$stateParams', 'CommentsFactory',
            function ($scope, $state, ngDialog, exhibitions, $sce, $stateParams, comments) {

            if($state.current.name == 'show_exhibition'){
                $scope.$parent.header_url = 'yellow';
                $scope.exhibition = {};

                exhibitions.show($stateParams.id).success(function(data){
                    $scope.exhibition = data.exhibition;
                    $('.news-preview').append($($scope.exhibition.body));
                    $('.news-preview').append($('.news-meta'));
                });

                $scope.comments_page = 1;
                $scope.retrieveComments = function(){
                    comments.all({page: $scope.comments_page, entity_type: 'Exhibition', entity_id: $stateParams.id}).success(function (data) {
                        $scope.comments = data.comments;
                        $scope.count = data.count;

                        var pagination = $('#comments-pagination');
                        pagination.empty();
                        pagination.removeData('twbs-pagination');
                        pagination.unbind('page');

                        if($scope.count > 0){
                            pagination.twbsPagination({
                                totalPages: Math.ceil($scope.count / 10),
                                startPage: $scope.comments_page,
                                visiblePages: 9,
                                onPageClick: function (event, page) {
                                    $scope.comments_page = page;
                                    $scope.retrieveComments();
                                }
                            });
                        }
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
                        comments.create({text: $scope.new_comment, entity_id: $stateParams.id, entity_type: 'Exhibition'}).success(function(){
                            $scope.new_comment = '';
                            $scope.retrieveComments();
                        })
                    }
                }
            }

            if($state.current.name == 'exhibitions'){
                $scope.$parent.header_url = 'yellow';

                $scope.exhibitions = [];

                $scope.page = 1;
                $scope.retrieveExhibition = function(){
                    exhibitions.all({page: $scope.page, filters: $scope.filters}).success(function (data) {
                        $scope.exhibitions = data.exhibitions;
                        $scope.count = data.count;

                        var pagination = $('#exhibitions-pagination');
                        pagination.empty();
                        pagination.removeData('twbs-pagination');
                        pagination.unbind('page');

                        if($scope.count > 0){
                            pagination.twbsPagination({
                                totalPages: Math.ceil($scope.count / 10),
                                startPage: $scope.page,
                                visiblePages: 9,
                                onPageClick: function (event, page) {
                                    $scope.page = page;
                                    $scope.retrieveExhibition();
                                }
                            });
                        }
                    }).error(function (data) {

                    });
                };

                $scope.retrieveExhibition();

                $scope.$watch('filters', function(){
                    $scope.retrieveExhibition();
                }, true);
            }

            $scope.getHtml = function(html){
                return $sce.trustAsHtml(html);
            };
        }])
}());