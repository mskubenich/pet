angular.module('petModeApp.directives', []).
    directive('appVersion', ['version', function (version) {
        return function (scope, elm, attrs) {
            elm.text(version);
        };
    }]).

    directive('emailAvailable', function($http) { // available
        return {
            require: 'ngModel',
            link: function(scope, elem, attr, ctrl) {
                ctrl.$parsers.push(function(viewValue) {
                    if(!viewValue || viewValue.length == 0){
                        ctrl.$setValidity('emailBlank', false);
                    }else{
                        ctrl.$setValidity('emailBlank', true);
                    }
                    if(viewValue && viewValue.match(/[a-z0-9\-_]+@[a-z0-9\-_]+\.[a-z0-9\-_]{2,}/)) {
                        ctrl.$setValidity('emailValid', true);
                        $http.post('/users/email_available', {email: viewValue})
                            .success(function(data, status, headers, config) {
                                console.log(status);
                                ctrl.$setValidity('emailAvailable', true);
                                return viewValue;
                            })
                            .error(function(data, status, headers, config) {
                                console.log("error");
                                ctrl.$setValidity('emailAvailable', false);
                                return undefined;
                            });
                    } else {
                        ctrl.$setValidity('emailValid', false);
                        return undefined;
                    }
                });
            }
        };
    //}).
    //
    //directive('emailValid', function() {
    //    return {
    //        require: 'ngModel',
    //        link: function(scope, elm, attrs, ctrl) {
    //            ctrl.$parsers.push(function(viewValue) {
    //                if (viewValue && viewValue.match(/[a-z0-9\-_]+@[a-z0-9\-_]+\.[a-z0-9\-_]{2,}/)) {
    //                    // it is valid
    //                    console.log("valid");
    //                    ctrl.$setValidity('emailValid', true);
    //                    return viewValue;
    //                } else {
    //                    console.log("invalid");
    //                    // it is invalid, return undefined (no model update)
    //                    ctrl.$setValidity('emailValid', false);
    //                    return undefined;
    //                }
    //            });
    //        }
    //    };
    });