json.products @products.each do |sale|
  json.id                sale.id
  json.family            sale.family
  json.name              sale.title
  json.description       sale.preview_text
  json.price             sale.price
  json.preview_image_url sale.preview_image_url
end
json.count @count