(function () {

    "use strict";

    angular.module('petModeAdminApp')
        .controller('AdminNewsController', ['$sce', '$scope', '$state', 'ngDialog', 'NewsFactory', function ($sce, $scope, $state, ngDialog, news) {

            $scope.getHtml = function(html){
                return $sce.trustAsHtml(html);
            };

            if($state.current.name == 'create_news'){
                $scope.submitted = false;

                $('#redactor').redactor({
                    buttonSource: true,
                    imageUpload: '/attachments',
                    fileUpload: '/attachments',
                    plugins: ['table', 'video']
                });

                $scope.processedNews = {scorp: false, rkf: false};
                $scope.upsertNews = function(){
                    $scope.processedNews.body = $('#redactor').redactor('code.get');
                    $scope.submited = true;
                    if($scope.newsForm.$invalid ){
                        return false;
                    }

                    $scope.newsProcessing = true;
                    news.create($scope.processedNews, $scope.preview_image)
                        .success(function(){
                            $scope.newsProcessing = false;
                            ngDialog.open({
                                className: 'ngdialog-theme-default',
                                template: "News successfully saved.",
                                plain: true
                            });
                        })
                        .error(function(data){
                            $scope.newsProcessing = false;
                            ngDialog.open({
                                className: 'ngdialog-theme-default',
                                template: JSON.stringify(data.errors),
                                plain: true
                            });
                        })
                };
            }

            if($state.current.name == 'news'){
                $scope.news = [];

                $scope.page = 1;
                $scope.retrieveNews = function(){
                    news.all({page: $scope.page}).success(function (data) {
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
            }
        }])
}());