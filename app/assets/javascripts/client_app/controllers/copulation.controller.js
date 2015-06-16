(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('CopulationController', ['$scope', '$state', 'ngDialog', 'CopulationsFactory', '$stateParams', '$timeout', '$sce',
            function ($scope, $state, ngDialog, copulations, $stateParams, $timeout, $sce) {

            $scope.getHtml = function(html){
                return $sce.trustAsHtml(html);
            };

            $scope.I18n = I18n;
            $scope._ = _;

            $scope.breeds = [
                "Акита-ину",
                "Алабай или среднеазиатская овчарка",
                "Аляскинский маламут",
                "Американский бульдог",
                "Американский питбуль терьер",
                "Английский бульдог",
                "Английский кокер-спаниель",
                "Английский Мастиф",
                "Аргентинский дог",
                "Афганская борзая",
                "Басенджи",
                "Бассет-хаунд",
                "Бернский Зенненхунд",
                "Бигль",
                "Бладхаунд"
            ];

            if($state.current.name == 'copulation'){
                $scope.filters = {
                    family: 'all',
                    sex: 'all',
                    price: {
                        min: 0,
                        max: 1000000
                    },
                    breed: '',
                    scorp: false,
                    rkf: false,
                    bloodline: false
                };
                $scope.sale = [];

                var timer = false;
                $scope.$watch('filters', function(){
                    if(timer){
                        $timeout.cancel(timer)
                    }
                    timer= $timeout(function(){
                        $scope.retrieveCopulations();
                    }, 500)
                }, true);

                $scope.copulation = [];

                $scope.page = 1;
                $scope.retrieveCopulations = function(){
                    copulations.all({page: $scope.page, query: $scope.filters}).success(function (data) {
                        $scope.copulations = data.copulations;
                        $scope.count = data.count;

                        var pagination = $('#copulations-pagination');
                        pagination.empty();
                        pagination.removeData('twbs-pagination');
                        pagination.unbind('page');

                        pagination.twbsPagination({
                            totalPages: Math.ceil($scope.count / 9),
                            startPage: $scope.page,
                            visiblePages: 9,
                            onPageClick: function (event, page) {
                                $scope.page = page;
                                $scope.retrieveCopulations();
                            }
                        });
                    }).error(function (data) {

                    });
                };

                $scope.retrieveCopulations();
            }
            if($state.current.name == 'show_copulation'){
                $scope.copulation = {};

                $scope.rate = 4;
                $scope.max = 5;
                $scope.isReadonly = false;

                $scope.hoveringOver = function(value) {
                    $scope.overStar = value;
                    $scope.percent = 100 * (value / $scope.max);
                };

                $scope.ratingStates = [
                    {stateOn: 'glyphicon-ok-sign', stateOff: 'glyphicon-ok-circle'},
                    {stateOn: 'glyphicon-star', stateOff: 'glyphicon-star-empty'},
                    {stateOn: 'glyphicon-heart', stateOff: 'glyphicon-ban-circle'},
                    {stateOn: 'glyphicon-heart'},
                    {stateOff: 'glyphicon-off'}
                ];

                copulations.show($stateParams.id).success(function (data) {
                   $scope.copulation = data.copulation;
                   $scope.phone = $scope.copulation.owner_phone_hashed;
                   $scope.preview_image = $scope.copulation.preview_images[0];
                }).error(function (data) {

                });

                $scope.updatePreview = function(image){
                    $scope.preview_image = image;
                };

                $scope.showPhone = function(){
                    copulations.showPhone($stateParams.id).success(function (data) {
                            $scope.phone = data.copulation.owner_phone;
                        }).error(function (data) {
                            ngDialog.open({
                                className: 'ngdialog-theme-default',
                                template: "Вы должны войти чтобы увидеть номер владельца.",
                                plain: true
                            });
                    });
            }
            }
            if($state.current.name == 'new_copulation'){

                setTimeout(function(){
                    $('#redactor').redactor({
                        buttonSource: true,
                        imageUpload: '/attachments/copulation_description',
                        fileUpload: '/attachments/copulation_description',
                        plugins: ['table', 'video']
                    });
                });

                $scope.attachments = [];
                $scope.attachments_previews = [];
                $scope.$parent.header_url = 'client_app/templates/layouts/black-header.html';
                $scope.announcement = {};

                $scope.removeAttachment = function(i, event){
                    $scope.attachments[i] = 'null';
                    $(event.target).parents('.file-select').remove();
                };

                $scope.breeds = [
                    "Акита-ину",
                    "Алабай или среднеазиатская овчарка",
                    "Аляскинский маламут",
                    "Американский бульдог",
                    "Американский питбуль терьер",
                    "Английский бульдог",
                    "Английский кокер-спаниель",
                    "Английский Мастиф",
                    "Аргентинский дог",
                    "Афганская борзая",
                    "Басенджи",
                    "Бассет-хаунд",
                    "Бернский Зенненхунд",
                    "Бигль",
                    "Бладхаунд"
                ];

                $scope.submitAnnouncement = function(){
                    $scope.announcement.description = $('#redactor').redactor('code.get');
                    $scope.submitted = true;
                    if($scope.announcementForm.$invalid ){
                        return false;
                    }

                    $scope.processing = true;
                    copulations.upsert($scope.announcement, $scope.attachments, $scope.prize, $scope.bloodline, $scope.mothers_photo, $scope.fathers_photo)
                        .success(function(){
                            $scope.processing = false;
                            ngDialog.open({
                                className: 'ngdialog-theme-default',
                                template: "Announcement successfully saved.",
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
        }])
}());