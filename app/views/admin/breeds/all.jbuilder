json.breeds @breeds.each do |breed|
  json.id                breed.id
  json.title             breed.send("title_#{ I18n.locale }")
  json.family            breed.family
end