json.news @news.each do |news|
  json.id         news.id
  json.title      news.title
  json.body       news.body[0..40] + '...'
  json.rkf        news.rkf
  json.scorp      news.scorp
  json.created_at news.created_at
  # json.avatar_url news.avatar.url(:thumb)
end