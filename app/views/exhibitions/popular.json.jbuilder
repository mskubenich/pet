json.exhibitions @exhibitions do |exhibition|
  json.title exhibition.send("title_#{ I18n.locale }")
  json.body exhibition.send("body_#{ I18n.locale }").to_s[0..90] + '...'
  json.id exhibition.id
  json.created_at exhibition.created_at.strftime("%d/%m/%Y")
end