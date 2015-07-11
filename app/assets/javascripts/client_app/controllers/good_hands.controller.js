(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('GoodHandsController', ['$scope', '$state', 'ngDialog', 'GoodHandsFactory', '$stateParams', '$timeout', '$sce', 'Lightbox', 'BreedsFactory', 'CommentsFactory', 'NotesFactory',
            function ($scope, $state, ngDialog, good_hands, $stateParams, $timeout, $sce, Lightbox, breeds, comments, notes) {
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
                    breed_id: '',
                    scorp: false,
                    rkf: false,
                    bloodline: false
                };

                $scope.breeds = [];
                $scope.updateBreeds = function(){
                    breeds.all({family: $scope.filters.family})
                        .success(function(data){
                            $scope.breeds = data.breeds;
                            if(!_.contains(_.map($scope.breeds, function(breed){ return breed.id }), $scope.filters.breed_id)){
                                $scope.filters.breed_id = '';
                            }
                        })
                        .error(function(){

                        })
                };
                $scope.updateBreeds();

                $scope.$watch('filters.family', function(){
                    $scope.updateBreeds();
                });

                if($state.current.name == 'good_hands'){
                    $scope.$parent.header_url = 'client_app/templates/layouts/yellow-header.html';
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
                    $scope.$parent.header_url = 'client_app/templates/layouts/yellow-header.html';

                    //setTimeout(function(){
                    //    $scope.$watch('filters', function(){
                    //        $state.go('sale');
                    //    });
                    //}, 100);

                    $scope.announcement = {};
                    $scope.images = [];

                    $scope.rating = {
                        rating: 0,
                        max: 5,
                        isReadonly: true,
                        voices_count: 0
                    };
                    $scope.hoveringOver = function(value) {
                        $scope.overStar = value;
                        $scope.percent = 100 * (value / $scope.max);
                    };
                    var initializing = true;

                    good_hands.show($stateParams.id).success(function (data) {
                        $scope.announcement = data.good_hand;

                        notes.show({entity_type: 'GoodHand', entity_id: $scope.announcement.id})
                            .success(function(data){
                                $scope.rating.rating = data.note.rating;
                                $scope.rating.isReadonly = data.note.readonly;
                                $scope.rating.voices_count = data.note.voices_count;
                                $scope.$watch('rating.rating', function(){
                                    if (initializing) {
                                        $timeout(function() { initializing = false; });
                                    } else {
                                        $scope.rating.isReadonly = true;
                                        notes.create({points: $scope.rating.rating, entity_type: 'GoodHand', entity_id: $scope.announcement.id})
                                            .success(function(){
                                                initializing = true;
                                                notes.show({entity_type: 'GoodHand', entity_id: $scope.announcement.id})
                                                    .success(function(data){
                                                        $scope.rating.rating = data.note.rating;
                                                        $scope.rating.isReadonly = data.note.readonly;
                                                        $scope.rating.voices_count = data.note.voices_count;
                                                    });
                                            });
                                    }
                                });
                            });


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

                    $scope.comments_page = 1;
                    $scope.retrieveComments = function(){
                        comments.all({page: $scope.comments_page, entity_type: 'GoodHand', entity_id: $stateParams.id}).success(function (data) {
                            $scope.comments = data.comments;
                            $scope.count = data.count;

                            var pagination = $('#comments-pagination');
                            pagination.empty();
                            pagination.removeData('twbs-pagination');
                            pagination.unbind('page');
                            pagination.twbsPagination({
                                totalPages: Math.ceil($scope.count / 10),
                                startPage: $scope.comments_page,
                                visiblePages: 9,
                                onPageClick: function (event, page) {
                                    $scope.comments_page = page;
                                    $scope.retrieveComments();
                                }
                            });
                        }).error(function (data) {

                        });
                    };

                    $scope.retrieveComments();

                    $scope.new_comment = '';
                    $scope.comment = function(){
                        if($scope.new_comment.toString().trim() != ''){
                            comments.create({text: $scope.new_comment, entity_id: $stateParams.id, entity_type: 'GoodHand'}).success(function(){
                                $scope.new_comment = '';
                                $scope.retrieveComments();
                            })
                        }
                    }
                }
                if($state.current.name == 'new_hand'){
                    $scope.$parent.header_url = 'client_app/templates/layouts/black-header.html';

                    $scope.announcement = {};
                    $scope.updateBreeds2 = function(){
                        breeds.all({family: $scope.announcement.family})
                            .success(function(data){
                                $scope.breeds = data.breeds;

                                if(!_.contains(_.map($scope.breeds, function(breed){ return breed.id }), $scope.announcement.breed_id)){
                                    $scope.announcement.breed_id = null;
                                }
                            })
                            .error(function(){

                            })
                    };
                    $scope.updateBreeds2();

                    $scope.$watch('announcement.family', function(){
                        $scope.updateBreeds2();
                    });

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