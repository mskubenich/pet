json.news @news.each do |news|
  json.id                news.id
  json.title             news.title_ru
  json.body              news.body_ru.to_s[0..40] + '...'
  json.rkf               news.rkf
  json.scorp             news.scorp
  json.created_at        "#{ time_ago_in_words(news.created_at) } ago at #{ news.created_at.strftime "%H:%M"}"
  json.preview_image_url news.preview_image.url
end
json.news_count News.count