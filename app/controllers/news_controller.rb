class NewsController < ApplicationController
  load_and_authorize_resource :news
  skip_before_filter :authenticate_user

  def index
    @news = News.order('id desc').paginate page: params[:page], per_page: 10
  end

  def show

  end
end