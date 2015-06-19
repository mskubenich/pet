(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('SalesController', ['$scope', '$state', 'ngDialog', 'SalesFactory', '$stateParams', '$timeout', '$sce', 'Lightbox',
            function ($scope, $state, ngDialog, sales, $stateParams, $timeout, $sce, Lightbox) {
            $scope.I18n = I18n;
            $scope._ = _;

            $scope.getHtml = function(html){
                return $sce.trustAsHtml(html);
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

            $scope.filters = {
                family: 'all',
                sex: 'all',
                price: {
                    min: 0,
                    max: 100000
                },
                breed: '',
                scorp: false,
                rkf: false,
                bloodline: false
            };

            if($state.current.name == 'sale'){
                $scope.sale = [];

                var timer = false;
                $scope.$watch('filters', function(){
                    if(timer){
                        $timeout.cancel(timer)
                    }
                    timer= $timeout(function(){
                        $scope.retrievesales();
                    }, 500)
                }, true);

                $scope.page = 1;
                $scope.retrievesales = function(){
                    sales.all({page: $scope.page, query: $scope.filters}).success(function (data) {
                        $scope.sales = data.sales;
                        $scope.count = data.count;

                        var pagination = $('#sales-pagination');
                        pagination.empty();
                        pagination.removeData('twbs-pagination');
                        pagination.unbind('page');

                        pagination.twbsPagination({
                            totalPages: Math.ceil($scope.count / 9),
                            startPage: $scope.page,
                            visiblePages: 9,
                            onPageClick: function (event, page) {
                                $scope.page = page;
                                $scope.retrievesales();
                            }
                        });
                    }).error(function (data) {

                    });
                };

                $scope.retrievesales();
            }
            if($state.current.name == 'show_sale'){

                //setTimeout(function(){
                //    $scope.$watch('filters', function(){
                //        $state.go('sale');
                //    });
                //}, 100);

                $scope.sale = {};
                $scope.images = [];

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

                sales.show($stateParams.id).success(function (data) {
                    $scope.sale = data.sale;
                    $scope.phone = $scope.sale.owner_phone_hashed;
                    $scope.preview_image = $scope.sale.preview_images[0];
                    var i = 0;
                    for(i = 0; i < $scope.sale.preview_images.length; i++){
                        $scope.images.push({
                            'url': $scope.sale.preview_images[i].url,
                            'thumbUrl': $scope.sale.preview_images[i].url,
                            'caption': ''
                        });
                    }
                    if($scope.sale.prize_image_url){
                        $scope.prize_image_i = i;
                        $scope.images.push({
                            'url': $scope.sale.prize_image_url,
                            'thumbUrl': $scope.sale.prize_image_url,
                            'caption': I18n.t('prize')
                        });
                        i++;
                    }
                    if($scope.sale.bloodline_image_url){
                        $scope.bloodline_image_i = i;
                        $scope.images.push({
                            'url': $scope.sale.bloodline_image_url,
                            'thumbUrl': $scope.sale.bloodline_image_url,
                            'caption': I18n.t('bloodline')
                        });
                        i++;
                    }
                    if($scope.sale.mother_image_url){
                        $scope.mothers_image_i = i;
                        $scope.images.push({
                            'url': $scope.sale.mother_image_url,
                            'thumbUrl': $scope.sale.mother_image_url,
                            'caption': I18n.t('mothers_photo')
                        });
                        i++;
                    }
                    if($scope.sale.father_image_url){
                        $scope.fathers_image_i = i;
                        $scope.images.push({
                            'url': $scope.sale.father_image_url,
                            'thumbUrl': $scope.sale.father_image_url,
                            'caption': I18n.t('fathers_photo')
                        });
                        i++;
                    }
                }).error(function (data) {

                });

                $scope.updatePreview = function(image){
                    $scope.preview_image = image;
                };

                $scope.showPhone = function(){
                    sales.showPhone($stateParams.id).success(function (data) {
                        $scope.phone = data.sale.owner_phone;
                    }).error(function (data) {
                        ngDialog.open({
                            className: 'ngdialog-theme-default',
                            template: I18n.t('actions.you_must_enter_before'),
                            plain: true
                        });
                    });
                };

                $scope.openLightboxModal = function (index) {
                    console.log(index);
                    Lightbox.openModal($scope.images, index);
                };

            }
            if($state.current.name == 'new_sale'){

                setTimeout(function(){
                    $('#redactor').redactor({
                        buttonSource: true,
                        imageUpload: '/attachments/sale_description',
                        fileUpload: '/attachments/sale_description',
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

                $scope.submitAnnouncement = function(){
                    $scope.announcement.description = $('#redactor').redactor('code.get');
                    $scope.submitted = true;
                    if($scope.announcementForm.$invalid ){
                        return false;
                    }

                    $scope.processing = true;
                    sales.upsert($scope.announcement, $scope.attachments, $scope.prize, $scope.bloodline, $scope.mothers_photo, $scope.fathers_photo)
                        .success(function(){
                            $scope.processing = false;
                            ngDialog.open({
                                className: 'ngdialog-theme-default',
                                template: I18n.t('announcements.messages.success_upsert'),
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