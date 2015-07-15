json.users @users.each do |user|
  json.avatar_url user.avatar.url
  json.full_name user.full_name
end
json.count @count