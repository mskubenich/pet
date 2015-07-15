class FriendshipController < ApplicationController
  before_filter :setup_friends

  def create
    Friendship.request(@user, @friend)
    render json: {ok: true, message: "Friend request sent."}
  end

  def accept
    if @user.requested_friends.include?(@friend)
      Friendship.accept(@user, @friend)
      render json: {ok: true, message:"Friendship with #{@friend.full_name} accepted!"}
    else
      render json: {ok: false, message: "No friendship request from #{@friend.full_name}."}, status: :unprocessable_entity
    end
  end

  def decline
    if @user.requested_friends.include?(@friend)
      Friendship.breakup(@user, @friend)
      render json: {ok: true, message: "Friendship with #{@friend.full_name} declined" }
    else
      render json: {ok: false, message: "No friendship request from #{@friend.full_name}." }, status: :unprocessable_entity
    end
  end

  def cancel
    if @user.pending_friends.include?(@friend)
      Friendship.breakup(@user, @friend)
      render json: { ok: true, message: "Friendship request canceled." }
    else
      render json: { ok: false, message: "No request for friendship with #{@friend.full_name}" }
    end
  end

  def delete
    if @user.friends.include?(@friend)
      Friendship.breakup(@user, @friend)
      render json: { ok: true, message: "Friendship with #{@friend.full_name} deleted!"}
    else
      render json: { ok: false, message: "You aren't friends with #{@friend.full_name}"}, status: :unprocessable_entity
    end
  end

  private

  def setup_friends
    @user = current_user
    @friend = User.find(params[:id])
  end
end
