(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('SearchController', ['$scope', '$state', 'ngDialog', 'SalesFactory', '$stateParams', '$timeout', '$sce', 'Lightbox', 'SearchFactory',
            function ($scope, $state, ngDialog, sales, $stateParams, $timeout, $sce, Lightbox, search) {
                //$scope.$parent.header_url = 'client_app/templates/layouts/black-header.html';
                $('body').css('background-color', 'white');
                $scope.I18n = I18n;
                $scope._ = _;

                $scope.$state = $state;
                $scope.$parent.$state = $state;

                $scope.getHtml = function(html){
                    return $sce.trustAsHtml(html);
                };

                var timer = false;
                $scope.$parent.$watch('query_word', function(){
                    if(timer){
                        $timeout.cancel(timer)
                    }
                    timer= $timeout(function(){
                        $scope.retrieveSearch();
                    }, 500)
                }, true);

                $scope.search_results = [];

                $scope.page = 1;
                $scope.retrieveSearch = function(){
                    search.all({page: $scope.page, q: $scope.query_word}).success(function (data) {
                        $scope.search_results = data.search_results;
                        $scope.count = data.count;

                        var pagination = $('#search-pagination');
                        pagination.empty();
                        pagination.removeData('twbs-pagination');
                        pagination.unbind('page');

                        if($scope.count > 0){
                            pagination.twbsPagination({
                                totalPages: Math.ceil($scope.count / 10),
                                startPage: $scope.page,
                                visiblePages: 10,
                                onPageClick: function (event, page) {
                                    $scope.page = page;
                                    $scope.retrieveSearch();
                                }
                            });
                        }
                    }).error(function (data) {

                    });
                };

                if($scope.query_word){
                    $scope.retrieveSearch();
                }
            }])
}());