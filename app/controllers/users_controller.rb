class UsersController < ApplicationController
  include SessionsHelper
  skip_before_filter :authenticate_user, except: [:profile]

  def index
    user_arel = User.arel_table
    query = user_arel.project(Arel.star).where(
        user_arel[:email].matches("%#{ params[:q] }%")
            .or(user_arel[:first_name].matches("%#{ params[:q] }%"))
            .or(user_arel[:last_name].matches("%#{ params[:q] }%"))
            .and(user_arel[:id].not_eq(current_user.id))
    )

    count_query = query.clone.project('COUNT(*) as count')
    @users = User.find_by_sql(query.take(10).skip((params[:page].to_i - 1) * 10).to_sql)
    @count = User.find_by_sql(count_query.to_sql).first["count"]
  end

  def create
    @user = User.new user_params
    if @user.save
      sign_in @user
      render json: {ok: true}
    else
      render json: {errors: @user.errors.full_messages.join( )}, status: :unprocessable_entity
    end
  end

  def avatar
    current_user.update_attributes({avatar: params[:file]})
    render nothing: true
  end

  def profile
    @user = current_user
  end

  def my_info
    @user = current_user
  end

  def update_profile
    @user = current_user
    if @user.update_attributes user_params
      render json: {ok: true}
    else
      render json: {errors: @user.errors}, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def email_available
    query = User.all
    query = query.where email: params[:email]
    query = query.where.not(id: params[:except]) if params[:except]

    if query.count == 0
      render json: {ok: true}
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  def friends
    @users = current_user.friends.where("email LIKE ? OR first_name LIKE ? OR last_name LIKE ?", "%#{ params[:q]}%", "%#{ params[:q]}%", "%#{ params[:q]}%").paginate page: params[:page], per_page: 10
    @count = current_user.friends.where("email LIKE ? OR first_name LIKE ? OR last_name LIKE ?", "%#{ params[:q]}%", "%#{ params[:q]}%", "%#{ params[:q]}%").count
  end

  def requested_friends
    @users = current_user.requested_friends.where("email LIKE ? OR first_name LIKE ? OR last_name LIKE ?", "%#{ params[:q]}%", "%#{ params[:q]}%", "%#{ params[:q]}%").paginate page: params[:page], per_page: 10
    @count = current_user.requested_friends.where("email LIKE ? OR first_name LIKE ? OR last_name LIKE ?", "%#{ params[:q]}%", "%#{ params[:q]}%", "%#{ params[:q]}%").count
  end

  def pending_friends
    @users = current_user.pending_friends.where("email LIKE ? OR first_name LIKE ? OR last_name LIKE ?", "%#{ params[:q]}%", "%#{ params[:q]}%", "%#{ params[:q]}%").paginate page: params[:page], per_page: 10
    @count = current_user.pending_friends.where("email LIKE ? OR first_name LIKE ? OR last_name LIKE ?", "%#{ params[:q]}%", "%#{ params[:q]}%", "%#{ params[:q]}%").count
  end

  def friends_preview
    @users = current_user.friends.sample(3)
  end

  def become_specialist
    current_user.update_attributes specialist_requested: true, specialist_type: params[:specialist][:profession], specialist_reject_reason: nil
    render json: {ok: true}
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :login, :password, :password_confirmation, :user_profession, :specialist_type, :avatar, :email, :phone, :country_id, :city)
  end
end