json.competitions @competitions do |competition|
  json.title competition.send("title_#{ I18n.locale }")
  json.body competition.send("body_#{ I18n.locale }").to_s[0..90] + '...'
  json.id competition.id
  json.created_at competition.created_at.strftime("%d/%m/%Y")
end