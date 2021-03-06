(function () {

    "use strict";

    angular.module('petModeAdminApp')
        .controller('AdminGoodHandsController', ['$scope', '$state', 'ngDialog', 'GoodHandsFactory', '$stateParams', '$timeout', '$sce', 'BreedsFactory', 'CountriesFactory',
            function ($scope, $state, ngDialog, good_hands, $stateParams, $timeout, $sce, breeds, countries) {
                $scope.I18n = I18n;
                $scope._ = _;
                $scope.$state = $state;

                $scope.getHtml = function(html){
                    return $sce.trustAsHtml(html);
                };
                $scope.filters = {
                    family: 'all',
                    sex: 'all',
                    breed_id: '',
                    scorp: false,
                    rkf: false,
                    country_id: ''
                };

                $scope.breeds = [];
                $scope.updateBreeds = function(){
                    breeds.titles({family: $scope.filters.family})
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

                $scope.selected_country = {};
                countries.all()
                    .success(function(data){
                        $scope.countries = data.countries;
                    });

                if($state.current.name == 'good_hands'){

                    $scope.announcement = [];

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
                        console.log(JSON.stringify($scope.filters));
                        good_hands.all({page: $scope.page, query: $scope.filters}).success(function (data) {
                            $scope.announcements = data.good_hands;
                            $scope.count = data.count;

                            var pagination = $('#announcements-pagination');
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
                                        $scope.retrieveAnnouncements();
                                    }
                                });
                            }
                        }).error(function (data) {

                        });
                    };

                    $scope.retrieveAnnouncements();

                    $scope.destroy = function(id){
                        var scope = $scope;
                        ngDialog.open({
                            className: 'ngdialog-theme-default',
                            template: 'client_app/templates/admin/good_hands/confirm_removing.html',
                            controller: ['$scope', function ($scope) {
                                $scope.I18n = I18n;
                                $scope.destroy = function () {
                                    good_hands.destroy(id).success(function(){
                                        $scope.closeThisDialog();
                                        scope.retrieveAnnouncements();
                                    });
                                };
                            }]
                        });
                    };
                }

                if($state.current.name == 'new_hand' || $state.current.name == 'edit_hand'){

                    $scope.announcement = {};

                    $scope.updateBreeds2 = function(){
                        breeds.titles({family: $scope.announcement.family})
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
                            plugins: ['table', 'video']});
                    });

                    if($state.current.name == 'new_hand'){
                        $scope.announcement = {scorp: false, rkf: false};
                    }

                    if($state.current.name == 'edit_hand'){
                        good_hands.show($stateParams.id)
                            .success(function(data){
                                $timeout(function(){
                                    $scope.announcement = data.good_hand;
                                    $('#redactor').redactor('code.set', $scope.announcement.description);
                                    $scope.bloodline_checked = $scope.announcement.bloodline_file_name != null;
                                    $scope.prize_checked = $scope.announcement.prize_file_name != null;
                                }, 0);
                            })
                    }

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
                    $scope.validation_errors = {};

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
                        good_hands.upsert($scope.announcement, $scope.attachments, $scope.prize, $scope.bloodline, $scope.mothers_photo, $scope.fathers_photo, $scope.removed_attachments_previews)
                            .success(function(){
                                $scope.processing = false;
                                ngDialog.open({
                                    className: 'ngdialog-theme-default',
                                    template: I18n.t('good_hands.messages.success_upsert'),
                                    plain: true
                                });
                                $state.go('good_hands')
                            })
                            .error(function(data){
                                $scope.validation_errors = data.errors;
                                $scope.processing = false;
                            })
                    };

                    $scope.approve = function(){
                        good_hands.approve($stateParams.id).success(function(){
                            $scope.announcement.approved = true;
                        });
                    };

                    $scope.reject = function(){
                        var scope = $scope;
                        var id = $stateParams.id;
                        ngDialog.open({
                            className: 'ngdialog-theme-default',
                            template: 'client_app/templates/admin/good_hands/reject.html',
                            controller: ['$scope', function ($scope) {
                                $scope.I18n = I18n;
                                $scope.reject = function (reason) {
                                    good_hands.reject(id, reason).success(function(){
                                        scope.announcement.approved = false;
                                        $scope.closeThisDialog();
                                    });
                                };
                            }]
                        });
                    }
                }
            }])
}());