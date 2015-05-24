(function () {
    "use strict";
    var petModeApp = angular.module('petModeApp', [
        'ui.router',
        'templates',
        'ngDialog'
    ]);

    petModeApp.config(['$urlRouterProvider', '$stateProvider', function ($urlRouterProvider, $stateProvider) {
        $urlRouterProvider.otherwise('home');
        $stateProvider
            .state('home',{
                url: '',
                templateUrl: 'templates/admin/pages/index.html'
            })
            .state('workers',{
                url: '/workers',
                templateUrl: 'application/templates/admin/workers/index.html',
                controller: 'AdminWorkersController'
            });
    }]);

    petModeApp.run(['$http', '$rootScope', function($http, $rootScope){
        var csrf_token = $('meta[name="csrf-token"]').attr('content');
        $http.defaults.headers.common['X-CSRF-Token'] = csrf_token;
    }]);


}());