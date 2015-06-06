(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('CopulationController', ['$scope', '$state', 'ngDialog', 'CopulationsFactory',
            function ($scope, $state, ngDialog, copulations) {
            $scope.I18n = I18n;

            if($state.current.name == 'new_copulation'){
                $scope.$parent.header_url = 'client_app/templates/layouts/black-header.html';
                $scope.announcement = {};

                $scope.breeds = [
                    "Акита-ину",
                    "Алабай или среднеазиатская овчарка",
                    "Аляскинский маламут",
                    "Американский бульдог",
                    "Американский питбуль терьер",
                    "Английский бульдог",
                    "Английский кокер-спаниель",
                    "Английский Мастиф",
                    "Аргентинский дог",
                    "Афганская борзая",
                    "Басенджи",
                    "Бассет-хаунд",
                    "Бернский Зенненхунд",
                    "Бигль",
                    "Бладхаунд"
                ];

                $scope.submitAnnouncement = function(){
                    $scope.submitted = true;
                    if($scope.announcementForm.$invalid ){
                        return false;
                    }

                    $scope.processing = true;
                    copulations.upsert($scope.announcement, $scope.photo1, $scope.photo2, $scope.photo3, $scope.photo4)
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