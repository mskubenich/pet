class ExpertsController < ApplicationController
  skip_before_filter :authenticate_user

  def index
    @experts = User.where specialist: true
  end

  def show
    @expert = User.find params[:id]
  end
end