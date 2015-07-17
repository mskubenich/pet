json.messages @messages.each do |message|
  json.created_at "#{ time_ago_in_words(message.created_at) } #{ t('datetime.ago')} #{ t 'datetime.at'} #{ message.created_at.strftime "%H:%M"}"
  json.text message.text
  json.author_name message.author.full_name
  json.author_avatar message.author.avatar.url(:thumb)
  json.user_id message.author.id
end