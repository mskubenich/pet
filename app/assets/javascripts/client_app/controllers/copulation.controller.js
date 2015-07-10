(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('CopulationController', ['$scope', '$state', 'ngDialog', 'CopulationsFactory', '$stateParams', '$timeout', '$sce', 'Lightbox', 'BreedsFactory', 'CommentsFactory',
            function ($scope, $state, ngDialog, copulations, $stateParams, $timeout, $sce, Lightbox, breeds, comments) {

            $('body').css('background-color', 'white');
            $scope.getHtml = function(html){
                return $sce.trustAsHtml(html);
            };

            $scope.I18n = I18n;
            $scope._ = _;

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

            if($state.current.name == 'copulation'){
                $scope.$parent.header_url = 'client_app/templates/layouts/yellow-header.html';
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
                $scope.$parent.header_url = 'client_app/templates/layouts/yellow-header.html';

                //setTimeout(function(){
                //    $scope.$watch('filters', function(){
                //        $state.go('copulation');
                //    });
                //}, 100);

                $scope.copulation = {};
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

                copulations.show($stateParams.id).success(function (data) {
                    $scope.copulation = data.copulation;
                    $scope.phone = $scope.copulation.owner_phone_hashed;
                    $scope.preview_image = $scope.copulation.preview_images[0];
                    var i = 0;
                    for(i = 0; i < $scope.copulation.preview_images.length; i++){
                        $scope.images.push({
                            'url': $scope.copulation.preview_images[i].url,
                            'thumbUrl': $scope.copulation.preview_images[i].url,
                            'caption': ''
                        });
                    }
                    if($scope.copulation.prize_image_url){
                        $scope.prize_image_i = i;
                        $scope.images.push({
                            'url': $scope.copulation.prize_image_url,
                            'thumbUrl': $scope.copulation.prize_image_url,
                            'caption': I18n.t('prize')
                        });
                        i++;
                    }
                    if($scope.copulation.bloodline_image_url){
                        $scope.bloodline_image_i = i;
                        $scope.images.push({
                            'url': $scope.copulation.bloodline_image_url,
                            'thumbUrl': $scope.copulation.bloodline_image_url,
                            'caption': I18n.t('bloodline')
                        });
                        i++;
                    }
                    if($scope.copulation.mother_image_url){
                        $scope.mothers_image_i = i;
                        $scope.images.push({
                            'url': $scope.copulation.mother_image_url,
                            'thumbUrl': $scope.copulation.mother_image_url,
                            'caption': I18n.t('mothers_photo')
                        });
                        i++;
                    }
                    if($scope.copulation.father_image_url){
                        $scope.fathers_image_i = i;
                        $scope.images.push({
                            'url': $scope.copulation.father_image_url,
                            'thumbUrl': $scope.copulation.father_image_url,
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
                    copulations.showPhone($stateParams.id).success(function (data) {
                            $scope.phone = data.copulation.owner_phone;
                        }).error(function (data) {
                            ngDialog.open({
                                className: 'ngdialog-theme-default',
                                template: I18n.t('actions.you_must_enter_before'),
                                plain: true
                            });
                    });
                };

                $scope.openLightboxModal = function (index) {
                    Lightbox.openModal($scope.images, index);
                };

                $scope.comments_page = 1;
                $scope.retrieveComments = function(){
                    comments.all({page: $scope.comments_page, entity_type: 'Copulation', entity_id: $stateParams.id}).success(function (data) {
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
                        comments.create({text: $scope.new_comment, entity_id: $stateParams.id, entity_type: 'Copulation'}).success(function(){
                            $scope.new_comment = '';
                            $scope.retrieveComments();
                        })
                    }
                }
            }
            if($state.current.name == 'new_copulation'){
                $scope.$parent.header_url = 'client_app/templates/layouts/black-header.html';

                $scope.announcement = {};
                $scope.updateBreeds2 = function(){
                    breeds.all({family: $scope.announcement.family})
                        .success(function(data){
                            $scope.breeds2 = data.breeds;

                            if(!_.contains(_.map($scope.breeds2, function(breed){ return breed.id }), $scope.announcement.breed_id)){
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
                        imageUpload: '/attachments/copulation_description',
                        fileUpload: '/attachments/copulation_description',
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