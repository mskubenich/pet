(function () {

    "use strict";

    angular.module('petModeAdminApp')
        .controller('AdminStaticPagesController', ['$sce', '$scope', '$state', 'ngDialog', 'StaticPagesFactory', '$stateParams', '$rootScope',
            function ($sce, $scope, $state, ngDialog, pages, $stateParams, $rootScope) {
            $rootScope.$state = $state;
            $scope.I18n = I18n;

            $scope.getHtml = function(html){
                return $sce.trustAsHtml(html);
            };

            if($state.current.name == 'static_pages'){
                $scope.pages = ['help', 'rules', 'team', 'contacts'];
            }

            if($state.current.name == 'static_page'){
                pages.show($stateParams.name).success(function(data){
                    $scope.page = data.page;
                    if(!$scope.page.body_ru == null){
                        $scope.page.body_ru = '';
                    }
                    if(!$scope.page.body_en == null){
                        $scope.page.body_en = '';
                    }
                    $('#redactor_ru').redactor('code.set', $scope.page.body_ru);
                    $('#redactor_en').redactor('code.set', $scope.page.body_en);
                });

                $('#redactor_ru').redactor({
                    buttonSource: true,
                    imageUpload: '/attachments/static_pages',
                    fileUpload: '/attachments/static_pages',
                    plugins: ['table', 'video']
                });

                $('#redactor_en').redactor({
                    buttonSource: true,
                    imageUpload: '/attachments/static_pages',
                    fileUpload: '/attachments/static_pages',
                    plugins: ['table', 'video']
                });

                $scope.updatePage = function(){
                    $scope.page.body_ru = $('#redactor_ru').redactor('code.get');
                    $scope.page.body_en = $('#redactor_en').redactor('code.get');

                    $scope.processing = true;
                    pages.update($scope.page)
                        .success(function(){
                            $scope.processing = false;
                            ngDialog.open({
                                className: 'ngdialog-theme-default',
                                template: I18n.t('pages.messages.success_upsert'),
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
        }])
}());