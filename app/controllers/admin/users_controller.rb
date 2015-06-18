class Admin::UsersController < AdminController

  load_and_authorize_resource :user

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
    @count = User.count
  end

  def destroy
    @user.destroy
    render json: {ok: true}
  end
end