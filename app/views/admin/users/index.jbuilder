json.users @users.each do |user|
  json.id         user.id
  json.email      user.email
  json.login      user.login
  json.rkf        user.rkf
  json.scorp      user.scorp
  json.created_at user.created_at
  json.avatar_url user.avatar.url(:thumb)
  json.banned     user.banned
  json.country    user.country
  json.city       user.city
end
json.count @count