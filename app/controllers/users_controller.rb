class UsersController < ApplicationController
  def create
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
end
