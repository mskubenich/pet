class SessionsController < ApplicationController
  skip_before_filter :authenticate_user, only: [:create]

  include SessionsHelper

  def current_user_info
    if current_user
      render json: {current_user: {full_name: current_user.full_name, is_admin: current_user.admin?}}
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  def create
    params.permit!
    user = User.find_by(email: params[:session][:login].to_s.downcase)
    user = User.find_by(login: params[:session][:login]) unless user
    if user && user.authenticate(params[:session][:password])
      sign_in user
      render json: {ok: true}
    else
      render json: {error: "Wrong email/password confirmation."}, status: 401
    end
  end

  def destroy
    sign_out
    render json: {ok: true}
  end
end