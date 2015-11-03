(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('ExpertsController', ['$scope', '$state', 'ngDialog', 'ExpertsFactory', '$stateParams', 'CommentsFactory', 'Lightbox',
            function ($scope, $state, ngDialog, experts, $stateParams, comments, Lightbox) {
            $('body').css('background-color', 'white');

            if($state.current.name == 'experts'){
                $scope.$parent.header_url = 'yellow';
                $scope.experts = [];

                //var timer = false;
                //$scope.$watch('filters', function(){
                //    if(timer){
                //        $timeout.cancel(timer)
                //    }
                //    timer= $timeout(function(){
                //        $scope.retrieveCopulations();
                //    }, 500)
                //}, true);
                //
                //$scope.copulation = [];

                $scope.page = 1;
                $scope.retrieveExperts = function(){
                    experts.all({page: $scope.page, query: $scope.filters}).success(function (data) {
                        $scope.experts = data.experts;
                        $scope.count = data.count;

                        var pagination = $('#experts-pagination');
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
                                    $scope.retrieveExperts();
                                }
                            });
                        }
                    }).error(function (data) {

                    });
                };

                $scope.retrieveExperts();
            }

            if($state.current.name == 'show_expert'){
                $scope.$parent.header_url = 'yellow';

                $scope.expert = {};
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

                experts.show($stateParams.id).success(function (data) {

                    $scope.expert = data.expert;

                    //$scope.rating.rating = data.note.rating;
                    //$scope.rating.isReadonly = data.note.readonly;
                    //$scope.rating.voices_count = data.note.voices_count;
                    //
                    //$scope.$watch('rating.rating', function(){
                    //    if (initializing) {
                    //        $timeout(function() { initializing = false; });
                    //    } else {
                    //        $scope.rating.isReadonly = true;
                    //        notes.create({points: $scope.rating.rating, entity_type: 'expert', entity_id: $scope.expert.id})
                    //            .success(function(){
                    //                initializing = true;
                    //                notes.show({entity_type: 'expert', entity_id: $scope.expert.id})
                    //                    .success(function(data){
                    //                        $scope.rating.rating = data.note.rating;
                    //                        $scope.rating.isReadonly = data.note.readonly;
                    //                        $scope.rating.voices_count = data.note.voices_count;
                    //                    });
                    //            });
                    //    }
                    //});

                    var i = 0;
                    for(i = 0; i < $scope.expert.pets_images.length; i++){
                        $scope.images.push({
                            'url': $scope.expert.pets_images[i],
                            'thumbUrl': $scope.expert.pets_images[i],
                            'caption': ''
                        });
                    }


                    $scope.openLightboxModal = function (index) {
                        Lightbox.openModal($scope.images, index);
                    };


                    $scope.phone = $scope.expert.owner_phone_hashed;
                }).error(function (data) {

                });

                $scope.updatePreview = function(image){
                    $scope.preview_image = image;
                };

                $scope.showPhone = function(){
                    experts.showPhone($stateParams.id).success(function (data) {
                        $scope.phone = data.expert.owner_phone;
                    }).error(function (data) {
                        ngDialog.open({
                            className: 'ngdialog-theme-default',
                            template: I18n.t('actions.you_must_enter_before'),
                            plain: true
                        });
                    });
                };

                $scope.comments_page = 1;
                $scope.retrieveComments = function(){
                    comments.all({page: $scope.comments_page, entity_type: 'expert', entity_id: $stateParams.id}).success(function (data) {
                        $scope.comments = data.comments;
                        $scope.count = data.count;

                        var pagination = $('#comments-pagination');
                        pagination.empty();
                        pagination.removeData('twbs-pagination');
                        pagination.unbind('page');

                        if($scope.count > 0){
                            pagination.twbsPagination({
                                totalPages: Math.ceil($scope.count / 10),
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
                        comments.create({text: $scope.new_comment, entity_id: $stateParams.id, entity_type: 'expert'}).success(function(){
                            $scope.new_comment = '';
                            $scope.retrieveComments();
                        })
                    }
                }
            }
        }])
}());