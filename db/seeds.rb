puts "Create admin ..."
admin = User.create first_name: 'admin', last_name: 'admin', email: 'admin@petmode.com', login: 'admin', password: 'secret', password_confirmation: 'secret'
admin.roles << Role.admin