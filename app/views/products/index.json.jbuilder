json.products @products.each do |product|
  json.id                product.id
  json.family            product.family
  json.name              product.title
  json.description       product.preview_text
  json.price             product.price
  json.preview_image_url product.preview_image_url
  json.rate              4
end
json.count @count