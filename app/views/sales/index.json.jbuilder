json.sales @sales.each do |sale|
  json.id                sale.id
  json.family            sale.family
  json.name              sale.name
  json.rkf               sale.rkf
  json.scorp             sale.scorp
  json.breed             sale.breed
  json.description       sale.description.to_s[0..100] + '...'
  json.price             sale.price
  json.preview_image_url sale.preview_image_url
  json.has_prize         sale.prize.exists?
end
json.count @count