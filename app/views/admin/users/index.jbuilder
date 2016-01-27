json.users @users.each do |user|
  json.id                   user.id
  json.email                user.email
  json.login                user.login
  json.user_profession user.user_profession
  json.created_at           user.created_at.strftime('%m/%d/%Y')
  json.avatar_url           user.avatar.url(:thumb)
  json.banned               user.banned
  json.country              user.country
  json.city                 user.city
  json.specialist           !!user.specialist
  json.specialist_requested !!user.specialist_requested
end
json.count @count