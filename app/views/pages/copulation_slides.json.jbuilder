json.copulation_slides @copulations do |c|
  json.preview_image_url c.preview_image_url
  json.name c.name
  json.breed c.breed.try("title_#{ I18n.locale}")
  json.id c.id
  json.rating c.rating
end