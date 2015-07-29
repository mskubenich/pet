json.competition do
  json.id                @competition.id
  json.title             @competition.send("title_#{ params[:locale]}")
  json.body              @competition.send("body_#{ params[:locale]}")
  json.rkf               @competition.rkf
  json.scorp             @competition.scorp
  json.created_at        "#{ time_ago_in_words(@competition.created_at) } #{ t('datetime.ago')} #{ t 'datetime.at'} #{ @competition.created_at.strftime "%H:%M"}"
  json.preview_image_url @competition.preview_image.url
  json.author            @competition.author.login
  json.author_avatar_url @competition.author.avatar.url(:thumb)
  json.comments_count    @competition.comments.count
  json.views_count       @competition.views.count
end