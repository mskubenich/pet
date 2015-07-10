json.sales @sales.each do |sale|
  json.id                sale.id
  json.family            sale.family
  json.name              sale.name
  json.rkf               sale.rkf
  json.scorp             sale.scorp
  json.breed             sale.breed.try("title_#{ I18n.locale }")
  json.description       sale.preview_text
  json.price             sale.price
  json.preview_image_url sale.preview_image_url
  json.has_prize         sale.prize.exists?
  json.approved          sale.approved
  json.comments_count    sale.comments.count
end
json.count @count