json.products @products.each do |product|
  json.id                product.id
  json.family            product.family
  json.name              product.title
  json.description       product.preview_text
  json.price             product.price
  json.preview_image_url product.preview_image_url
  json.comments_count    product.comments.count
  json.rating do
      json.rating product.rating
      json.isReadonly product.noted(current_user) || !current_user
      json.voices_count product.voices_count
  end
end
json.count @count
json.new_product do
  json.id @new_product.id
  json.title @new_product.title
  json.description @new_product.description
  json.preview_image_url @new_product.preview_image_url
  json.price @new_product.price
end