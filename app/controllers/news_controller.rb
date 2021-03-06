class NewsController < ApplicationController
  load_and_authorize_resource :news, only: [:index, :show]
  skip_before_filter :authenticate_user
  before_filter :calculate_view, only: [:show]

  def index
    query = News.all

    if params[:categories].present?
      category_ids = JSON.parse(params[:categories]).delete_if { |k, v| v.nil? }.keys
      query = query.where(news_category_id: category_ids) if category_ids.any?
    end

    @news = query.order('news.id desc').paginate page: params[:page], per_page: 10
    @count = query.count
  end

  def show

  end

  def categories
    @categories = Category.all
  end

  def popular
    @news = News.popular(2)
  end

  private

  def calculate_view
    View.create entity_type: News, entity_id: @news.id, ip: request.ip
  end
end