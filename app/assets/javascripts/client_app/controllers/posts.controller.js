(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('PostsController', ['$sce', '$scope', '$state', 'ngDialog', 'PostsFactory', function ($sce, $scope, $state, ngDialog, posts) {

            $scope.post = {
                rkf: false,
                scorp: false,
                title: '',
                body: ''
            };

            $scope.retrievePosts = function(){
                posts.all().success(function(data){
                    $scope.posts = data.posts;
                })
            };
            $scope.retrievePosts();

            $scope.submitPost = function(){
                //$scope.post.description = $('#post-redactor').redactor('code.get');
                $scope.submitted = true;
                if($scope.postForm.$invalid ){
                    return false;
                }

                $scope.processing = true;
                posts.upsert($scope.post, $scope.post_image)
                    .success(function(){
                        $scope.processing = false;
                        ngDialog.open({
                            className: 'ngdialog-theme-default',
                            template: "Post successfully saved.",
                            plain: true
                        });
                    })
                    .error(function(data){
                        $scope.processing = false;
                        ngDialog.open({
                            className: 'ngdialog-theme-default',
                            template: JSON.stringify(data.errors),
                            plain: true
                        });
                    })
            };

        }])
}());