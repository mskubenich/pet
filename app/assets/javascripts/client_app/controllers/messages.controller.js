(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('MessagesController', ['$sce', '$scope', '$state', 'ngDialog', '$stateParams', 'MessagesFactory', 'UsersFactory', '$interval',
            function ($sce, $scope, $state, ngDialog, $stateParams, messages, users, $interval) {

            $scope.$state = $state;

            if($state.current.name == 'user_messages'){
                $scope.retrieveUser = function(){
                    users.show($stateParams.id).success(function(data){
                        $scope.user = data.profile;
                        $scope.profile = data.profile;
                    });
                };
                $scope.retrieveUser();

                $scope.retrieveMessages = function(){
                    messages.show($stateParams.id)
                        .success(function(data){
                            $scope.messages = data.messages;
                        })
                };
                $scope.retrieveMessages();

                var intervalPromise = $interval(function(){
                    if($state.current.name == 'user_messages'){
                        $scope.retrieveMessages();
                    }
                }, 4000);
                $scope.$on('$destroy', function () { $interval.cancel(intervalPromise); });

                $scope.send = function(){
                    messages.send({text: $scope.message_text, user_id: $stateParams.id })
                        .success(function(data){
                            $scope.retrieveMessages();
                        })
                }
            }

            if($state.current.name == 'messages'){
                $scope.retrieveMessages = function(){
                    messages.all()
                        .success(function(data){
                            $scope.messages = data.messages;
                        })
                };
                $scope.retrieveMessages();
            }
        }])
}());