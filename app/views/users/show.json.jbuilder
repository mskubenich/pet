json.profile do
  json.avatar_url @user.avatar.url
  json.full_name @user.full_name
  json.phone @user.phone
  json.id @user.id
  json.friendship_status current_user.friendship_status(@user)
  json.phone_hashed  @user.phone.to_s[0..4] + '*****'
end