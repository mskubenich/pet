class Admin::UsersController < AdminController

  load_and_authorize_resource :user

  def index
    @users = User.all
    render json: {users: @users}
  end
end