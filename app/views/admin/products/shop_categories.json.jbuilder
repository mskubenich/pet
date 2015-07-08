json.shop_categories @shop_categories.each do |cat|
  json.id cat.id
  json.title cat.send("title_#{ I18n.locale }")
end