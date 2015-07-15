json.pending_friends @users.each do |user|
  json.avatar_url user.avatar.url
  json.full_name user.full_name
  json.id user.id
  json.friendship_status current_user.friendship_status(user)
end
json.count @count