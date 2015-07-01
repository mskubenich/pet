class CommentsController < ApplicationController

  def index
    query = Comment.where(entity_id: params[:entity_id], entity_type: params[:entity_type]).order('created_at DESC')
    @comments = query.paginate(page: params[:page], per_page: 10)
    @count = query.count
  end
end