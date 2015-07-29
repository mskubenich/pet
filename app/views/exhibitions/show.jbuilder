json.exhibition do
  json.id                @exhibition.id
  json.title             @exhibition.send("title_#{ params[:locale]}")
  json.body              @exhibition.send("body_#{ params[:locale]}")
  json.rkf               @exhibition.rkf
  json.scorp             @exhibition.scorp
  json.created_at        "#{ time_ago_in_words(@exhibition.created_at) } #{ t('datetime.ago')} #{ t 'datetime.at'} #{ @exhibition.created_at.strftime "%H:%M"}"
  json.preview_image_url @exhibition.preview_image.url
  json.author            @exhibition.author.login
  json.author_avatar_url @exhibition.author.avatar.url(:thumb)
  json.comments_count    @exhibition.comments.count
  json.views_count       @exhibition.views.count
end