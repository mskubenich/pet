json.posts @posts.each do |post|
  json.id                post.id
  json.title             post.title
  json.body              post.body
  json.rkf               post.rkf
  json.scorp             post.scorp
  json.image_url    post.image.url
  json.author            post.user.full_name
  json.created_at        "#{ time_ago_in_words(post.created_at) } #{ t('datetime.ago')} #{ t 'datetime.at'} #{ post.created_at.strftime "%H:%M"}"
end