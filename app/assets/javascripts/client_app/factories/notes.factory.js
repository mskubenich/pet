(function () {
    'use strict';
    angular.module('petModeApp').factory('NotesFactory', ['$http', function($http){
        return {
            show: function(options){
                return $http.get('/' + I18n.locale + '/notes/' + options.entity_id + '.json?entity_type=' + options.entity_type);
            },
            create: function(options){
                return $http.post('/notes', {note: { points: options.points, entity_id: options.entity_id, entity_type: options.entity_type}})
            }
        };
    }])
}());