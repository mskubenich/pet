json.user do
  json.first_name           @user.first_name
  json.last_name            @user.last_name
  json.email                @user.email
  json.login                @user.login
  json.phone                @user.phone
  json.user_profession @user.user_profession
  json.specialist_type @user.specialist_type
  json.id                   @user.id
  json.avatar               @user.avatar.url
  json.country              @user.country
  json.city                 @user.city
  json.specialist           !!@user.specialist
  json.specialist_requested !!@user.specialist_requested
  json.specialist_type      @user.specialist_type
end