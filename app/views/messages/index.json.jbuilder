json.messages @conversations.each do |message|

  if message.user_id == current_user.id
    @user = User.find(message.author_id)
  else
    @user = User.find(message.user_id)
  end

  json.created_at "#{ time_ago_in_words(message.created_at) } #{ t('datetime.ago')} #{ t 'datetime.at'} #{ message.created_at.strftime "%H:%M"}"
  json.text message.text
  json.author_name @user.full_name
  json.user_id @user.id
  json.author_avatar @user.avatar.url(:thumb)
end