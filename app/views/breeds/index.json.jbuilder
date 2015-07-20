json.breeds @breeds do |breed|
  json.title breed.send("title_#{ I18n.locale }")
  json.id breed.id
end