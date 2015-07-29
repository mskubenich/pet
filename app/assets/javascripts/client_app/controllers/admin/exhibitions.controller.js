(function () {

    "use strict";

    angular.module('petModeAdminApp')
        .controller('AdminExhibitionsController', ['$sce', '$scope', '$state', 'ngDialog', 'ExhibitionsFactory', '$stateParams', '$rootScope', 'CategoriesFactory',
            function ($sce, $scope, $state, ngDialog, exhibitions, $stateParams, $rootScope, categories) {
            $rootScope.$state = $state;

            $scope.getHtml = function(html){
                return $sce.trustAsHtml(html);
            };

            if($state.current.name == 'create_exhibition' || $state.current.name == 'edit_exhibition'){

                categories.titles().success(function(data){
                    $scope.categories = data.categories;
                });

                if($state.current.name == 'edit_exhibition'){
                    exhibitions.show($stateParams.id)
                        .success(function(data){
                            $scope.processedExhibition = data.exhibition;
                            $('#redactor_ru').redactor('code.set', $scope.processedExhibition.body_ru);
                            $('#redactor_en').redactor('code.set', $scope.processedExhibition.body_en);

                            if($scope.processedExhibition.preview_image_url){
                                $('#avatar-preview').css('background-image', 'url(' + $scope.processedExhibition.preview_image_url + ')');
                            }
                        })
                }

                $scope.submitted = false;

                $('#redactor_ru').redactor({
                    buttonSource: true,
                    imageUpload: '/attachments/exhibitions',
                    fileUpload: '/attachments/exhibitions',
                    plugins: ['table', 'video']
                });

                $('#redactor_en').redactor({
                    buttonSource: true,
                    imageUpload: '/attachments/exhibitions',
                    fileUpload: '/attachments/exhibitions',
                    plugins: ['table', 'video']
                });

                $scope.upsertExhibition = function(){
                    $scope.processedExhibition.body_ru = $('#redactor_ru').redactor('code.get');
                    $scope.processedExhibition.body_en = $('#redactor_en').redactor('code.get');
                    $scope.submited = true;
                    if($scope.exhibitionForm.$invalid ){
                        return false;
                    }

                    $scope.processing = true;
                    exhibitions.upsert($scope.processedExhibition, $scope.preview_image)
                        .success(function(){
                            $scope.processing = false;
                            ngDialog.open({
                                className: 'ngdialog-theme-default',
                                template: I18n.t('exhibition.messages.success_upsert'),
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
            }

            if($state.current.name == 'exhibitions'){

                $scope.exhibitions = [];

                $scope.page = 1;
                $scope.retrieveExhibitions = function(){
                    exhibitions.all({page: $scope.page}).success(function (data) {
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
                                    $scope.retrieveExhibitions();
                                }
                            });
                        }
                    }).error(function (data) {

                    });
                };

                $scope.destroyExhibition = function(exhibition_id){
                    exhibitions.destroy(exhibition_id).success(function(){
                        $scope.retrieveExhibitions();
                    })
                };

                $scope.retrieveExhibitions();
            }
        }])
}());