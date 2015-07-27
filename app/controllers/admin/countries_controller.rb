class Admin::CountriesController < AdminController
  def index
    @countries = Country.all
    render json: {countries: @countries}
  end
end