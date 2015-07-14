class PostsController < ApplicationController

  load_and_authorize_resource :post
  skip_before_filter :authenticate_user, only: [:index, :show]

  def create
    @post = Post.new post_params.merge({user_id: current_user.id})
    if @post.save
      render json: {ok: true}
    else
      render json: {errors: @post.errors}
    end
  end

  def update
    if @post.update_attributes post_params
      render json: {ok: true}
    else
      render json: {errors: @post.errors}
    end
  end

  def index
    @posts = current_user.posts.order('created_at DESC')
  end

  def show

  end

  def destroy
    @post.destroy
    render json: {ok: true}
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :rkf, :scorp, :image)
  end
end