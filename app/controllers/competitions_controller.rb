class CompetitionsController < ApplicationController
  load_and_authorize_resource :competition, only: [:index, :show]
  skip_before_filter :authenticate_user
  before_filter :calculate_view, only: [:show]

  def index
    query = Competition.all

    @competitions = query.order('competitions.id desc').paginate page: params[:page], per_page: 10
    @count = query.count
  end

  def show

  end

  def categories
    @categories = Category.all
  end

  def popular
    @competitions = Competition.popular(2)
  end

  private

  def calculate_view
    View.create entity_type: Competition, entity_id: @competition.id, ip: request.ip
  end
end