(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('SalesController', ['$scope', '$state', 'ngDialog', 'SalesFactory', '$stateParams', '$timeout', '$sce', 'Lightbox', 'BreedsFactory', 'CommentsFactory', 'NotesFactory', 'CountriesFactory',
            function ($scope, $state, ngDialog, sales, $stateParams, $timeout, $sce, Lightbox, breeds, comments, notes, countries) {
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
                        max: 1000000
                    },
                    breed_id: '',
                    scorp: false,
                    rkf: false,
                    bloodline: false,
                    country_id: ''
                };

                if(window.filters){
                    $scope.filters = window.filters;
                    window.filters = null;
                }

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

                if($state.current.name == 'sale'){
                    $scope.$parent.header_url = 'yellow';
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

                            if($scope.count){
                                pagination.twbsPagination({
                                    totalPages: Math.ceil($scope.count / 9),
                                    startPage: $scope.page,
                                    visiblePages: 9,
                                    onPageClick: function (event, page) {
                                        $scope.page = page;
                                        $scope.retrievesales();
                                    }
                                });
                            }
                        }).error(function (data) {

                        });
                    };

                    $scope.retrievesales();
                }
                if($state.current.name == 'show_sale'){
                    $scope.$parent.header_url = 'yellow';


                    var timer = false;
                    $scope.initializing = true;
                    $scope.$watch('filters', function(){
                        if(timer){
                            $timeout.cancel(timer)
                        }
                        timer= $timeout(function(){
                            console.log('here');
                            if($scope.initializing){
                                $scope.initializing = false;
                            }else{
                                window.filters = $scope.filters;
                                $state.go('sale');
                            }
                        }, 500)
                    }, true);

                    //$scope.$parent.selectizeCountry();

                    $scope.sale = {};
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

                    sales.show($stateParams.id).success(function (data) {

                        $scope.sale = data.sale;

                        notes.show({entity_type: 'Sale', entity_id: $scope.sale.id})
                            .success(function(data){
                                $scope.rating.rating = data.note.rating;
                                $scope.rating.isReadonly = data.note.readonly;
                                $scope.rating.voices_count = data.note.voices_count;

                                $scope.$watch('rating.rating', function(){
                                    if (initializing) {
                                        $timeout(function() { initializing = false; });
                                    } else {
                                        $scope.rating.isReadonly = true;
                                        notes.create({points: $scope.rating.rating, entity_type: 'Sale', entity_id: $scope.sale.id})
                                            .success(function(){
                                                initializing = true;
                                                notes.show({entity_type: 'Sale', entity_id: $scope.sale.id})
                                                    .success(function(data){
                                                        $scope.rating.rating = data.note.rating;
                                                        $scope.rating.isReadonly = data.note.readonly;
                                                        $scope.rating.voices_count = data.note.voices_count;
                                                    });
                                            });
                                    }
                                });
                            });

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

                    $scope.comments_page = 1;
                    $scope.retrieveComments = function(){
                        comments.all({page: $scope.comments_page, entity_type: 'Sale', entity_id: $stateParams.id}).success(function (data) {
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
                            comments.create({text: $scope.new_comment, entity_id: $stateParams.id, entity_type: 'Sale'}).success(function(){
                                $scope.new_comment = '';
                                $scope.retrieveComments();
                            })
                        }
                    }
                }
                if($state.current.name == 'new_sale'){
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

                    setTimeout(function(){
                        $('#redactor').redactor({
                            buttonSource: true,
                            imageUpload: '/attachments/sale_description',
                            fileUpload: '/attachments/sale_description',
                            plugins: ['table', 'video']});
                    });

                    $scope.announcement = {scorp: false, rkf: false};

                    $scope.$watch('announcement.family', function(){
                        $scope.updateBreeds2();
                    });

                    $scope.attachments = [];
                    $scope.attachments_previews = [];
                    $scope.removed_attachments_previews = [];

                    $scope.removeExistingAttachment = function(id){
                        $scope.removed_attachments_previews.push(id);
                        $(event.target).parents('.file-select').remove();
                    };

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
                        if($scope.announcement.description.length == 0){
                            $scope.description_error = true;
                            return false;
                        }else{
                            $scope.description_error = false;
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
                                $scope.validation_errors = data.errors;
                                $scope.processing = false;
                            })
                    };
                }
        }])
}());