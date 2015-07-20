json.pets @pets.each do |pet|
  json.name pet.name
  json.id pet.id
  json.user_id pet.user_id
  json.breed pet.breed.try("title_#{ I18n.locale }")
  json.image pet.preview_image_url
  json.rating 4
end