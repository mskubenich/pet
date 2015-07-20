(function () {
    'use strict';
    angular.module('petModeApp').factory('MyPetsFactory', ['$http', function($http){
        return {
            upsert: function(pet, attachments, removed_attachments_previews){
                var fd = new FormData();
                fd.append('pet[family]', pet.family);
                fd.append('pet[name]', pet.name);
                fd.append('pet[breed_id]', pet.breed_id);
                var i = 0;
                while(i < removed_attachments_previews.length){
                    fd.append('pet[removed_photos][]', removed_attachments_previews[i]);
                    i++
                }
                i = 0;
                while(i < attachments.length){
                    if(attachments[i] != 'null'){
                        fd.append('pet[photos][]', attachments[i]);
                    }
                    i++
                }

                if(pet.id){
                    return $http.put('/my_pets/' + pet.id, fd, {
                        transformRequest: angular.identity,
                        headers: {'Content-Type': undefined}
                    });
                }else{
                    return $http.post('/my_pets', fd, {
                        transformRequest: angular.identity,
                        headers: {'Content-Type': undefined}
                    });
                }
            },
            all: function(options){
                return $http.get('/my_pets');
            },
            show: function(id){
                return $http.get('/my_pets/' + id + '.json');
            },
            destroy: function(id){
                return $http.delete('/my_pets/' + id)
            }
        }
        ;
    }])
}());