class NewsController < ApplicationController
  load_and_authorize_resource :news

  def index
    @news = News.order('id desc').paginate page: params[:page], per_page: 10
  end

  def show

  end
end