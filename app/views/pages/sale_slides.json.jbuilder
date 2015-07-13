json.sale_slides @sales do |sale|
  json.preview_image_url sale.preview_image_url
  json.name sale.name
  json.breed sale.breed.try("title_#{ I18n.locale }")
  json.id sale.id
  json.rating sale.rating
end