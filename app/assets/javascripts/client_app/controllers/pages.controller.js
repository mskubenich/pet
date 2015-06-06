(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('PagesController', ['$sce', '$scope', '$state', 'ngDialog', 'StaticPagesFactory', function ($sce, $scope, $state, ngDialog, pages) {

            $scope.$parent.header_url = 'client_app/templates/layouts/yellow-header.html';

            $scope.$state = $state;

            $scope.getHtml = function(html){
                return $sce.trustAsHtml(html);
            };

            pages.show($state.current.name).success(function(data){
                $scope.page = data.page['body_' + gon.locale]
            })
        }])
}());