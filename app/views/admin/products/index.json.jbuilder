json.products @products.each do |product|
  json.id                product.id
  json.family            product.family
  json.title             product.title
  json.description       product.description.to_s[0..100] + '...'
  json.price             product.price
  json.created_at "#{ time_ago_in_words(product.created_at) } #{ t('datetime.ago')} #{ t 'datetime.at'} #{ product.created_at.strftime "%H:%M"}"
end
json.count @count