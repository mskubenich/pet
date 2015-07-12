json.slides @products do |product|
  json.image_url product.attachments.sample.try(:file).try(:url, :thumb)
  json.title product.title
  json.price product.price
  json.id product.id
end