(function () {

    "use strict";

    angular.module('petModeAdminApp')
        .controller('AdminCompetitionsController', ['$sce', '$scope', '$state', 'ngDialog', 'CompetitionsFactory', '$stateParams', '$rootScope', 'CategoriesFactory',
            function ($sce, $scope, $state, ngDialog, competitions, $stateParams, $rootScope, categories) {
            $rootScope.$state = $state;

            $scope.getHtml = function(html){
                return $sce.trustAsHtml(html);
            };

            if($state.current.name == 'create_competition' || $state.current.name == 'edit_competition'){

                categories.titles().success(function(data){
                    $scope.categories = data.categories;
                });

                if($state.current.name == 'create_competition'){
                    $scope.processedCompetition = {scorp: false, rkf: false };
                }

                if($state.current.name == 'edit_competition'){
                    competitions.show($stateParams.id)
                        .success(function(data){
                            $scope.processedCompetition = data.competition;
                            $('#redactor_ru').redactor('code.set', $scope.processedCompetition.body_ru);
                            $('#redactor_en').redactor('code.set', $scope.processedCompetition.body_en);

                            if($scope.processedCompetition.preview_image_url){
                                $('#avatar-preview').css('background-image', 'url(' + $scope.processedCompetition.preview_image_url + ')');
                            }
                        })
                }

                $scope.submitted = false;

                $('#redactor_ru').redactor({
                    buttonSource: true,
                    imageUpload: '/attachments/competitions',
                    fileUpload: '/attachments/competitions',
                    plugins: ['table', 'video']
                });

                $('#redactor_en').redactor({
                    buttonSource: true,
                    imageUpload: '/attachments/competitions',
                    fileUpload: '/attachments/competitions',
                    plugins: ['table', 'video']
                });

                $scope.upsertCompetition = function(){
                    $scope.processedCompetition.body_ru = $('#redactor_ru').redactor('code.get');
                    $scope.processedCompetition.body_en = $('#redactor_en').redactor('code.get');
                    $scope.submited = true;
                    if($scope.competitionForm.$invalid ){
                        return false;
                    }

                    $scope.processing = true;
                    competitions.upsert($scope.processedCompetition, $scope.preview_image)
                        .success(function(){
                            $scope.processing = false;
                            ngDialog.open({
                                className: 'ngdialog-theme-default',
                                template: I18n.t('competition.messages.success_upsert'),
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

            if($state.current.name == 'competitions'){

                $scope.competitions = [];

                $scope.page = 1;
                $scope.retrieveCompetitions = function(){
                    competitions.all({page: $scope.page}).success(function (data) {
                        $scope.competitions = data.competitions;
                        $scope.count = data.count;

                        var pagination = $('#competitions-pagination');
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
                                    $scope.retrieveCompetitions();
                                }
                            });
                        }
                    }).error(function (data) {

                    });
                };

                $scope.destroyCompetition = function(competition_id){
                    competitions.destroy(competition_id).success(function(){
                        $scope.retrieveCompetitions();
                    })
                };

                $scope.retrieveCompetitions();
            }
        }])
}());