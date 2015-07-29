class ExhibitionsController < ApplicationController
  load_and_authorize_resource :exhibition, only: [:index, :show]
  skip_before_filter :authenticate_user
  before_filter :calculate_view, only: [:show]

  def index
    query = Exhibition.all

    @exhibitions = query.order('exhibitions.id desc').paginate page: params[:page], per_page: 10
    @count = query.count
  end

  def show

  end

  def categories
    @categories = Category.all
  end

  def popular
    @exhibitions = Exhibition.popular(2)
  end

  private

  def calculate_view
    View.create entity_type: Exhibition, entity_id: @exhibition.id, ip: request.ip
  end
end