class BreedsController < ApplicationController
  load_and_authorize_resource :breed
  def index
    query = Breed.all
    query = query.where family: params[:family] if params[:family] == 'cat' || params[:family] == 'dog'
    @breeds = query
  end
end