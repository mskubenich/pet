json.slides @products do |product|
  json.image_url product.attachments.sample.try(:file).try(:url, :thumb)
  json.description product.description.to_s[0..15] + ' ...'
  json.price product.price
end