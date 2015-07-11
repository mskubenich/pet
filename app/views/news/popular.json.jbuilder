json.news @news do |news|
  json.title news.send("title_#{ I18n.locale }")
  json.body news.send("body_#{ I18n.locale }").to_s[0..90] + '...'
  json.id news.id
  json.created_at news.created_at.strftime("%d/%m/%Y")
end