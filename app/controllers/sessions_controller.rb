class SessionsController < ApplicationController
  skip_before_filter :authenticate_user, only: [:create]

  include SessionsHelper

  def current_user_info
    if current_user
      render json: {
                 current_user: {
                     id: current_user.id,
                     full_name: current_user.full_name,
                     is_admin: current_user.admin?,
                     avatar_url: current_user.avatar.url(:thumb),
                     cart_items_count: current_user.cart.cart_items.count
                 }
             }
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  def create
    params.permit!
    user = User.find_by(email: params[:session][:login].to_s.downcase)
    user = User.find_by(login: params[:session][:login]) unless user
    if user && user.authenticate(params[:session][:password]) && user.banned != true
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