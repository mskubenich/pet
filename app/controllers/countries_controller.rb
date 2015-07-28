class CountriesController < ApplicationController

  skip_before_filter :authenticate_user

  def index
    @countries = Country.all
    render json: {countries: @countries}
  end
end