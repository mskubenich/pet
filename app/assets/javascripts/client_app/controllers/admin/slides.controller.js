(function () {

    "use strict";

    angular.module('petModeAdminApp')
        .controller('AdminSlidesController', ['$scope', '$state', 'ngDialog', 'SlidesFactory', '$stateParams', function ($scope, $state, ngDialog, slides, $stateParams) {

            if($state.current.name == 'slides'){
                $scope.slides = [];

                $scope.page = 1;
                $scope.retrieveSlides = function(){
                    slides.all({page: $scope.page})
                        .success(function (data) {
                            $scope.slides = data.main_slides;
                            $scope.count = data.count;

                            var pagination = $('#slides-pagination');
                            pagination.empty();
                            pagination.removeData('twbs-pagination');
                            pagination.unbind('page');

                            pagination.twbsPagination({
                                totalPages: Math.ceil($scope.count / 10),
                                startPage: $scope.page,
                                visiblePages: 9,
                                onPageClick: function (event, page) {
                                    $scope.page = page;
                                    $scope.retrieveSlides();
                                }
                            });
                        })
                        .error(function (data) {

                        });
                };

                $scope.retrieveSlides();

                $scope.removeSlide = function(id){
                    var scope = $scope;
                    ngDialog.open({
                        className: 'ngdialog-theme-default',
                        template: 'client_app/templates/admin/slides/confirm_removing.html',
                        controller: ['$scope', function ($scope) {
                            $scope.I18n = I18n;
                            $scope.destroy = function () {
                                slides.remove(id).success(function(){
                                    $scope.closeThisDialog();
                                    scope.retrieveSlides();
                                });
                            };
                        }]
                    });
                };
            }

            if($state.current.name == 'new_slide'){
                $scope.submitSlide = function () {
                    $scope.submited = true;

                    if($scope.slideForm.$invalid ){
                        return false;
                    }

                    $scope.slide = {};

                    slides.create($scope.slide, $scope.slide_image)
                        .success(function(data, status, headers, config){
                            ngDialog.open({
                                className: 'ngdialog-theme-default',
                                template: I18n.t('slides.messages.success_upsert'),
                                plain: true
                            });
                        })
                        .error(function (data, status, headers, config) {
                            if(data.errors){
                                ngDialog.open({
                                    className: 'ngdialog-theme-default',
                                    template: JSON.stringify(data.errors),
                                    plain: true
                                });
                            }
                        });
                };
            }
        }])
}());