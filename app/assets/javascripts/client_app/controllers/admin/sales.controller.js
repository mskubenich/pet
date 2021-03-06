(function () {

    "use strict";

    angular.module('petModeAdminApp')
        .controller('AdminSalesController', ['$scope', '$state', 'ngDialog', 'SalesFactory', '$stateParams', '$timeout', '$sce', 'BreedsFactory', 'CountriesFactory',
            function ($scope, $state, ngDialog, sales, $stateParams, $timeout, $sce, breeds, countries) {
                $scope.I18n = I18n;
                $scope._ = _;
                $scope.$state = $state;
                $scope.$parent.$state = $state;

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

                if($state.current.name == 'sales'){
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

                            if($scope.count == 0){
                                return
                            }

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

                    $scope.destroy = function(id){
                        var scope = $scope;
                        ngDialog.open({
                            className: 'ngdialog-theme-default',
                            template: 'client_app/templates/admin/sales/confirm_removing.html',
                            controller: ['$scope', function ($scope) {
                                $scope.I18n = I18n;
                                $scope.destroy = function () {
                                    sales.destroy(id).success(function(){
                                        $scope.closeThisDialog();
                                        scope.retrievesales();
                                    });
                                };
                            }]
                        });
                    };
                }

                if($state.current.name == 'new_sale' || $state.current.name == 'edit_sale'){

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

                    setTimeout(function(){
                        $('#redactor').redactor({
                            buttonSource: true,
                            imageUpload: '/attachments/sale_description',
                            fileUpload: '/attachments/sale_description',
                            plugins: ['table', 'video']});
                    });

                    if($state.current.name == 'new_sale'){
                        $scope.announcement = {scorp: false, rkf: false};
                    }

                    if($state.current.name == 'edit_sale'){
                        sales.show($stateParams.id)
                            .success(function(data){
                                $timeout(function(){
                                    $scope.announcement = data.sale;
                                    $('#redactor').redactor('code.set', $scope.announcement.description);
                                    $scope.bloodline_checked = $scope.announcement.bloodline_file_name != null;
                                    $scope.prize_checked = $scope.announcement.prize_file_name != null;
                                }, 0);
                            }
                        )
                    }

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
                                $state.go('sales')
                            })
                            .error(function(data){
                                $scope.validation_errors = data.errors;
                                $scope.processing = false;
                            })
                    };

                    $scope.approve = function(){
                        sales.approve($stateParams.id).success(function(){
                            $scope.announcement.approved = true;
                        });
                    };

                    $scope.reject = function(){
                        var scope = $scope;
                        var id = $stateParams.id;
                        ngDialog.open({
                            className: 'ngdialog-theme-default',
                            template: 'client_app/templates/admin/sales/reject.html',
                            controller: ['$scope', function ($scope) {
                                $scope.I18n = I18n;
                                $scope.reject = function (reason) {
                                    sales.reject(id, reason).success(function(){
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