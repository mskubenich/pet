class Admin::UsersController < AdminController

  load_and_authorize_resource :user

  def index
    @users = User.all
  end
end