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

  def show

  end

  def update
    if @user.update_attributes user_params
      render json: {ok: true}
    else
      render json: {errors: @user.errors}, status: :unprocessable_entity
    end
  end

  def ban
    @user.update_attribute :banned, true
    render json: {ok: true}
  end

  def unban
    @user.update_attribute :banned, false
    render json: {ok: true}
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :login, :password, :password_confirmation, :rkf, :scorp, :avatar, :email, :phone)
  end
end