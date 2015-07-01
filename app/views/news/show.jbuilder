json.news do
  json.id                @news.id
  json.title             @news.send("title_#{ params[:locale]}")
  json.body              @news.send("body_#{ params[:locale]}")
  json.rkf               @news.rkf
  json.scorp             @news.scorp
  json.created_at        "#{ time_ago_in_words(@news.created_at) } #{ t('datetime.ago')} #{ t 'datetime.at'} #{ @news.created_at.strftime "%H:%M"}"
  json.preview_image_url @news.preview_image.url
  json.author            @news.author.login
  json.author_avatar_url @news.author.avatar.url(:thumb)
  json.categories        @news.categories.map{|c| {id: c.id, title: c.send("title_#{ I18n.locale }")}}
  json.comments_count    @news.comments.count
end