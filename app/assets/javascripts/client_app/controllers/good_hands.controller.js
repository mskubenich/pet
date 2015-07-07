(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('GoodHandsController', ['$scope', '$state', 'ngDialog', 'GoodHandsFactory', '$stateParams', '$timeout', '$sce', 'Lightbox', 'BreedsFactory',
            function ($scope, $state, ngDialog, good_hands, $stateParams, $timeout, $sce, Lightbox, breeds) {
                $('body').css('background-color', 'white');
                $scope.I18n = I18n;
                $scope._ = _;

                $scope.getHtml = function(html){
                    return $sce.trustAsHtml(html);
                };

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

                $scope.breeds = [];
                $scope.updateBreeds = function(){
                    breeds.all({family: $scope.filters.family})
                        .success(function(data){
                            $scope.breeds = data.breeds;
                        })
                        .error(function(){

                        })
                };
                $scope.updateBreeds();

                $scope.$watch('filters.family', function(){
                    $scope.updateBreeds();
                });

                if($state.current.name == 'good_hands'){
                    $scope.sale = [];

                    var timer = false;
                    $scope.$watch('filters', function(){
                        if(timer){
                            $timeout.cancel(timer)
                        }
                        timer= $timeout(function(){
                            $scope.retrieveAnnouncements();
                        }, 500)
                    }, true);

                    $scope.page = 1;
                    $scope.retrieveAnnouncements = function(){
                        good_hands.all({page: $scope.page, query: $scope.filters}).success(function (data) {
                            $scope.announcements = data.announcements;
                            $scope.count = data.count;

                            var pagination = $('#announcements-pagination');
                            pagination.empty();
                            pagination.removeData('twbs-pagination');
                            pagination.unbind('page');

                            pagination.twbsPagination({
                                totalPages: Math.ceil($scope.count / 9),
                                startPage: $scope.page,
                                visiblePages: 9,
                                onPageClick: function (event, page) {
                                    $scope.page = page;
                                    $scope.retrieveAnnouncements();
                                }
                            });
                        }).error(function (data) {

                        });
                    };

                    $scope.retrieveAnnouncements();
                }

                if($state.current.name == 'show_hand'){

                    //setTimeout(function(){
                    //    $scope.$watch('filters', function(){
                    //        $state.go('sale');
                    //    });
                    //}, 100);

                    $scope.announcement = {};
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

                    good_hands.show($stateParams.id).success(function (data) {
                        $scope.announcement = data.good_hand;
                        $scope.phone = $scope.announcement.owner_phone_hashed;
                        $scope.preview_image = $scope.announcement.preview_images[0];
                        var i = 0;
                        for(i = 0; i < $scope.announcement.preview_images.length; i++){
                            $scope.images.push({
                                'url': $scope.announcement.preview_images[i].url,
                                'thumbUrl': $scope.announcement.preview_images[i].url,
                                'caption': ''
                            });
                        }
                        if($scope.announcement.prize_image_url){
                            $scope.prize_image_i = i;
                            $scope.images.push({
                                'url': $scope.announcement.prize_image_url,
                                'thumbUrl': $scope.announcement.prize_image_url,
                                'caption': I18n.t('prize')
                            });
                            i++;
                        }
                        if($scope.announcement.bloodline_image_url){
                            $scope.bloodline_image_i = i;
                            $scope.images.push({
                                'url': $scope.announcement.bloodline_image_url,
                                'thumbUrl': $scope.announcement.bloodline_image_url,
                                'caption': I18n.t('bloodline')
                            });
                            i++;
                        }
                        if($scope.announcement.mother_image_url){
                            $scope.mothers_image_i = i;
                            $scope.images.push({
                                'url': $scope.announcement.mother_image_url,
                                'thumbUrl': $scope.announcement.mother_image_url,
                                'caption': I18n.t('mothers_photo')
                            });
                            i++;
                        }
                        if($scope.announcement.father_image_url){
                            $scope.fathers_image_i = i;
                            $scope.images.push({
                                'url': $scope.announcement.father_image_url,
                                'thumbUrl': $scope.announcement.father_image_url,
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
                        good_hands.showPhone($stateParams.id).success(function (data) {
                            $scope.phone = data.good_hand.owner_phone;
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
                if($state.current.name == 'new_hand'){

                    setTimeout(function(){
                        $('#redactor').redactor({
                            buttonSource: true,
                            imageUpload: '/attachments/good_hand_description',
                            fileUpload: '/attachments/good_hand_description',
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
                        good_hands.upsert($scope.announcement, $scope.attachments, $scope.prize, $scope.bloodline, $scope.mothers_photo, $scope.fathers_photo)
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