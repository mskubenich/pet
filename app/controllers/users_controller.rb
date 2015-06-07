class UsersController < ApplicationController
  include SessionsHelper
  skip_before_filter :authenticate_user, except: [:profile]

  def create
    @user = User.new user_params
    if @user.save
      sign_in @user
      render json: {ok: true}
    else
      render json: {errors: @user.errors}, status: :unprocessable_entity
    end
  end

  def avatar
    current_user.update_attributes({avatar: params[:file]})
    render nothing: true
  end

  def profile
    @user = current_user
  end

  def email_available
    if User.where(email: params[:email]).count == 0
      render json: {ok: true}
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :login, :password, :password_confirmation, :rkf, :scorp, :avatar, :email, :phone)
  end
end
