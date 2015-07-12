class BreedsController < ApplicationController
  skip_before_filter :authenticate_user
  def index
    query = Breed.all
    query = query.where family: params[:family] if params[:family] == 'cat' || params[:family] == 'dog'
    @breeds = query
  end
end