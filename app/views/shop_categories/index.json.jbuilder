json.shop_categories @shop_categories.each do |cat|
  json.title cat.send "title_#{ I18n.locale }"
  json.id cat.id
  json.subcategories cat.shop_subcategories.each do |sub_cat|
    json.title sub_cat.send "title_#{ I18n.locale }"
    json.id sub_cat.id
  end
end