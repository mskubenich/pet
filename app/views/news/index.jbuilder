json.news @news.each do |news|
  json.id                news.id
  json.title             news.send("title_#{ params[:locale] }")
  json.body              news.send("body_#{ params[:locale] }").to_s[0..600] + '...'
  json.rkf               news.rkf
  json.scorp             news.scorp
  json.created_at        "#{ time_ago_in_words(news.created_at) } #{ t('datetime.ago')} #{ t 'datetime.at'} #{ news.created_at.strftime "%H:%M"}"
  json.preview_image_url news.preview_image.url
  json.author            news.author.login
  json.author_avatar_url news.author.avatar.url(:thumb)
end
json.news_count News.count