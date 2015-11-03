class ExpertsController < ApplicationController
  load_and_authorize_resource :expert, class: User

  def index
    @experts = User.where specialist: true
  end

  def show

  end
end