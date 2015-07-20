json.pets @pets.each do |pet|
  json.name pet.name
  json.breed pet.breed.try("title_#{ I18n.locale }")
  json.image pet.preview_image_url
end