json.profile do
  json.id @user.id
  json.avatar_url @user.avatar.url
  json.full_name @user.full_name
  json.phone @user.phone
  json.phone_hashed  @user.phone.to_s[0..4] + '*****'
  json.country @user.country
  json.country_id @user.country_id
  json.city @user.city.capitalize
  json.user_profession @user.user_profession
end