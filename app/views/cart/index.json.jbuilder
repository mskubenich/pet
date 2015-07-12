json.items @cart_items.each do |item|
  if item.product
    json.count item.count
    json.title item.product.title
    json.price item.product.price
    json.description item.product.description.to_s[0..40] + '...'
    json.preview_image_url item.product.preview_image_url
  end
end