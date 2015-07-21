(function () {

    "use strict";

    angular.module('petModeApp')
        .controller('MessagesController', ['$sce', '$scope', '$state', 'ngDialog', '$stateParams', 'MessagesFactory', 'UsersFactory', '$interval',
            function ($sce, $scope, $state, ngDialog, $stateParams, messages, users, $interval) {

                function addSmileToText(key, position, text) {
                    if (position == 0 || position == text.length) {
                        return (text + key);
                    } else {
                        var subText = [text.substring(0, position), text.substring(position, text.length)];
                        text = subText[0] + key + subText[1];
                        return text;
                    }
                }

                $scope.$state = $state;
                $scope.cursorPossition = 0;

                if ($state.current.name == 'user_messages') {
                    $scope.message_text = '';

                    $scope.cursorPosVal = -1;

                    $scope.getCursorPos = function($event) {
                        var myEl = $event.target;
                        $scope.doGetCaretPosition(myEl);
                    };

                    $scope.doGetCaretPosition = function(oField) {
                        var iCaretPos = 0;

                        if (document.selection) {
                            oField.focus ();
                            var oSel = document.selection.createRange ();
                            oSel.moveStart ('character', -oField.value.length);
                            iCaretPos = oSel.text.length;
                        } else if (oField.selectionStart || oField.selectionStart == '0') {
                            iCaretPos = oField.selectionStart;
                        }
                        $scope.cursorPossition= iCaretPos;
                    };

                    $scope.smiles = {
                        ";-)": "wink", ":-D": "grin", ":-P": "tongue", ':-p': 'emotion', '8-)': 'eyehard',
                        ':_(': 'sob', ':((': 'upset', ':o': 'fear', ':|': 'nowords', '3-)': 'sad',
                        ':X': 'mouthclosed', ':(': 'cry', '<3': 'heard', ':-*': 'kiss', ':-(': 'goodlook'
                    };

                    $scope.addSmile = function (key) {
                        $scope.message_text = addSmileToText(key, $scope.cursorPossition, $scope.message_text);
                    };

                    $scope.retrieveUser = function () {
                        users.show($stateParams.id).success(function (data) {
                            $scope.user = data.profile;
                            $scope.profile = data.profile;
                        });
                    };
                    $scope.retrieveUser();

                    $scope.retrieveMessages = function () {
                        messages.show($stateParams.id)
                            .success(function (data) {
                                $scope.messages = data.messages;
                            })
                    };
                    $scope.retrieveMessages();

                    var intervalPromise = $interval(function () {
                        if ($state.current.name == 'user_messages') {
                            $scope.retrieveMessages();
                        }
                    }, 4000);
                    $scope.$on('$destroy', function () {
                        $interval.cancel(intervalPromise);
                    });

                    $scope.send = function () {
                        messages.send({text: $scope.message_text, user_id: $stateParams.id})
                            .success(function (data) {
                                $scope.retrieveMessages();
                            })
                    }
                }

                if ($state.current.name == 'messages') {
                    $scope.retrieveMessages = function () {
                        messages.all()
                            .success(function (data) {
                                $scope.messages = data.messages;
                            })
                    };
                    $scope.retrieveMessages();
                }
            }])

    }());
