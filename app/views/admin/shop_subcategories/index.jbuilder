json.subcategories @categories.each do |news|
  json.id                news.id
  json.title             news.send("title_#{ I18n.locale }")
end
json.count @count