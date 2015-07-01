json.comments @comments.each do |comment|
  json.text comment.text
  json.created_at "#{ time_ago_in_words(comment.created_at) } #{ t('datetime.ago')} #{ t 'datetime.at'} #{ comment.created_at.strftime "%H:%M"}"
  json.author_name (comment.author || User.new).full_name
  json.author_avatar (comment.author || User.new).avatar.url(:thumb)
end
json.count @count