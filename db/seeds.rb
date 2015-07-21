puts "Create admin ..."
admin = User.create first_name: 'admin', last_name: 'admin', email: 'admin@petmode.com', login: 'admin', password: 'secret', password_confirmation: 'secret'
admin.roles << Role.admin

puts "Create users ..."
50.times do |i|
  user = User.create first_name: "user_#{ i }", last_name: "user_#{ i }", email: "user_#{ i }@petmode.com", login: "user_#{ i }", password: 'secret', password_confirmation: 'secret'
  user.roles << Role.user
end