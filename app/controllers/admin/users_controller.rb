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

  def approve_specialist
    @user.update_attributes specialist_approved: true, specialist: true, specialist_reject_reason: nil
    render json: {ok: true}
  end

  def reject_specialist
    @user.update_attributes specialist_approved: false, specialist_requested: false, specialist: false, specialist_reject_reason: params[:reason]
    params[:reason]
    render json: {ok: @user.id}
  end

  def remove_specialist
    @user.update_attributes specialist_approved: false, specialist_requested: false, specialist: false, specialist_reject_reason: nil
    render json: {ok: @user.id}
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :login, :password, :password_confirmation, :rkf, :scorp, :avatar, :email, :phone)
  end
end