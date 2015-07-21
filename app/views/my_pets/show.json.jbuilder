json.pet do
  json.id @my_pet.id
  json.name @my_pet.name
  json.breed_id @my_pet.breed_id
  json.family @my_pet.family
  json.preview_images  @my_pet.preview_images_url
end