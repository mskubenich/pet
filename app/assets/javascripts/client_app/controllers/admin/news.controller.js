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
                    imageUpload: '/webUpload/redactor/uploadImage/',
                    fileUpload: '/webUpload/redactor/fileUpload/',
                    plugins: ['table', 'video']
                });

                $scope.processedNews = {};
                $scope.upsertNews = function(){
                    $scope.processedNews.body = $('#redactor').redactor('code.get');
                    $scope.submited = true;
                    if($scope.newsForm.$invalid ){
                        return false;
                    }

                    $scope.newsProcessing = true;
                    news.create($scope.processedNews)
                        .success(function(){
                            $scope.newsProcessing = false;
                            ngDialog.open({
                                className: 'ngdialog-theme-default',
                                template: "News successfully saved.",
                                plain: true
                            });
                        //    TODO redirect to edit
                        })
                        .error(function(data){
                            $scope.newsProcessing = false;
                            ngDialog.open({
                                className: 'ngdialog-theme-default',
                                template: JSON.stringify(data.errors),
                                plain: true
                            });
                        })
                }
            }

            if($state.current.name == 'news'){
                $scope.news = [];
                news.all().success(function(data){
                    $scope.news = data.news;
                })
            }

            //$scope.userData = {};
            //$scope.submited = false;
            //
            //$scope.submitUserData = function () {
            //    $scope.submited = true;
            //
            //    if($scope.userForm.$invalid ){
            //        return false;
            //    }
            //
            //    users.create($scope.userData)
            //        .success(function(data, status, headers, config){
            //            if($scope.user_avatar){
            //                users.uploadAvatar($scope.user_avatar);
            //            }
            //            $state.go('home');
            //            ngDialog.open({
            //                className: 'ngdialog-theme-default',
            //                template: "Регистрация прошла успешно. Можете войти.",
            //                plain: true
            //            });
            //        })
            //        .error(function (data, status, headers, config) {
            //            if(data.errors){
            //                ngDialog.open({
            //                    className: 'ngdialog-theme-default',
            //                    template: JSON.stringify(data.errors),
            //                    plain: true
            //                });
            //            }
            //        });
            //};
        }])
}());