json.user do
  json.avatar_url @user.avatar.url
  json.first_name @user.first_name
  json.last_name @user.last_name
  json.email @user.email
  json.login @user.login
  json.phone @user.phone
  json.user_profession @user.user_profession
  json.country @user.country
  json.country_id @user.country_id
  json.city @user.city

  json.specialist @user.specialist?
  json.specialist_requested @user.specialist_requested
  json.specialist_approved @user.specialist_approved
  json.specialist_type @user.specialist_type
end