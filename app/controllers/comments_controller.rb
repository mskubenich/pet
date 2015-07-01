class CommentsController < ApplicationController

  def index
    query = Comment.where(entity_id: params[:entity_id], entity_type: params[:entity_type]).order('created_at DESC')
    @comments = query.paginate(page: params[:page], per_page: 10)
    @count = query.count
  end

  def create
    @comment = Comment.new comment_params
    @comment.author_id = current_user.id

    if @comment.save
      render json: {ok: true}
    else
      render json: {errors: @comment.errors}, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :entity_id, :entity_type)
  end
end