(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('CopulationController', ['$scope', '$state', 'ngDialog', 'CopulationsFactory', '$stateParams', '$timeout', '$sce',
            'Lightbox', 'BreedsFactory', 'CommentsFactory', 'NotesFactory', 'CountriesFactory',
            function ($scope, $state, ngDialog, copulations, $stateParams, $timeout, $sce, Lightbox, breeds, comments, notes, countries) {

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
                breed_id: '',
                scorp: false,
                rkf: false,
                bloodline: false,
                country_id: ''
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

            countries.all().success(function(data){
                $scope.countries = data.countries;
            });

            if($state.current.name == 'copulation'){
                $scope.$parent.header_url = 'yellow';
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

                        if($scope.count > 0){
                            pagination.twbsPagination({
                                totalPages: Math.ceil($scope.count / 9),
                                startPage: $scope.page,
                                visiblePages: 9,
                                onPageClick: function (event, page) {
                                    $scope.page = page;
                                    $scope.retrieveCopulations();
                                }
                            });
                        }
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

                $scope.ratingStates = [
                    {stateOn: 'glyphicon-ok-sign', stateOff: 'glyphicon-ok-circle'},
                    {stateOn: 'glyphicon-star', stateOff: 'glyphicon-star-empty'},
                    {stateOn: 'glyphicon-heart', stateOff: 'glyphicon-ban-circle'},
                    {stateOn: 'glyphicon-heart'},
                    {stateOff: 'glyphicon-off'}
                ];

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

                copulations.show($stateParams.id).success(function (data) {
                    $scope.copulation = data.copulation;

                    notes.show({entity_type: 'Copulation', entity_id: $scope.copulation.id})
                        .success(function(data){
                            $scope.rating.rating = data.note.rating;
                            $scope.rating.isReadonly = data.note.readonly;
                            $scope.rating.voices_count = data.note.voices_count;
                            $scope.$watch('rating.rating', function(){
                                if (initializing) {
                                    $timeout(function() { initializing = false; });
                                } else {
                                    $scope.rating.isReadonly = true;
                                    notes.create({points: $scope.rating.rating, entity_type: 'Copulation', entity_id: $scope.copulation.id})
                                        .success(function(){
                                            initializing = true;
                                            notes.show({entity_type: 'Copulation', entity_id: $scope.copulation.id})
                                                .success(function(data){
                                                    $scope.rating.rating = data.note.rating;
                                                    $scope.rating.isReadonly = data.note.readonly;
                                                    $scope.rating.voices_count = data.note.voices_count;
                                                });
                                        });
                                }
                            });
                        });

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
                        $scope.comments_count = data.count;

                        var pagination = $('#comments-pagination');
                        pagination.empty();
                        pagination.removeData('twbs-pagination');
                        pagination.unbind('page');

                        if($scope.comments_count > 0){
                            pagination.twbsPagination({
                                totalPages: Math.ceil($scope.comments_count / 10),
                                startPage: $scope.comments_page,
                                visiblePages: 9,
                                onPageClick: function (event, page) {
                                    $scope.comments_page = page;
                                    $scope.retrieveComments();
                                }
                            });
                        }
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
                $scope.$parent.header_url = 'black';

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
                $scope.$parent.header_url = 'black';

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
                            $scope.validation_errors = data.errors;
                            $scope.processing = false;
                        })
                };
            }
        }])
}());