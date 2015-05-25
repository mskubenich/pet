class SessionsController < ApplicationController
  skip_before_filter :authenticate_user

  include SessionsHelper

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

  def logout
    sign_out
    render json: {ok: true}
  end
end