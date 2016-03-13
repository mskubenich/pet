class WelcomeMailer < ApplicationMailer
  default from: 'admin@petmode.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to PetMode')
  end
end
