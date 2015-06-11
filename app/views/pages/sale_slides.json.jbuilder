json.sale_slides @sales do |sale|
  json.preview_image_url sale.preview_image_url
  json.name sale.name
  json.breed sale.breed
  json.id sale.id
end