json.shop_subcategories @shop_subcategories.each do |cat|
  json.id cat.id
  json.title cat.send("title_#{ I18n.locale }")
end