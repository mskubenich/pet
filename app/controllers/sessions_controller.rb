class SessionsController < ApplicationController
  skip_before_filter :authenticate_user, only: [:create, :current_session_info]

  include SessionsHelper

  def current_user_info
    if current_user
      render json: {
                 current_user: {
                     id: current_user.id,
                     full_name: current_user.service.try(:uname) || current_user.full_name,
                     is_admin: current_user.admin?,
                     avatar_url: current_user.service.try(:uimage) || current_user.avatar.url(:thumb),
                     cart_items_count: current_user.cart.cart_items.count,

                     specialist: current_user.specialist?,
                     specialist_requested: current_user.specialist_requested,
                     specialist_approved: current_user.specialist_approved,
                     specialist_type: current_user.specialist_type,
                     specialist_reject_reason: current_user.specialist_reject_reason
                 }
             }
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  def current_session_info
    CartItem.where("updated_at < ?", 3.days.ago).destroy_all
    render json: {
               current_session: {
                   cart_items_count: current_user ? current_user.cart.cart_items.map(&:count).sum : CartItem.where(session_id: session[:session_id]).map(&:count).sum
               }
           }
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