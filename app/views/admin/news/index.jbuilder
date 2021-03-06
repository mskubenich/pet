json.news @news.each do |news|
  json.id                news.id
  json.title             news.title_ru
  json.body              news.body_ru.to_s[0..40] + '...'
  json.rkf               news.rkf
  json.scorp             news.scorp
  json.created_at        "#{ time_ago_in_words(news.created_at) } #{ t('datetime.ago')} #{ t 'datetime.at'} #{ news.created_at.strftime "%H:%M"}"
  json.preview_image_url news.preview_image.url(:thumb)
  json.categories        news.categories.map{|c| {id: c.id, title: c.send("title_#{ I18n.locale }")}}
end
json.news_count News.count