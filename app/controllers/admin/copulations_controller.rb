class Admin::CopulationsController < AdminController

  load_and_authorize_resource :copulation

  def create
    @copulation = Copulation.new copulation_params
    if @copulation.save
      render json: {ok: true}
    else
      render json: {errors: @copulation.errors}
    end
  end

  private

  def copulation_params
    params.require(:copulation).permit(:family, :name, :age, :breed, :skorp, :rkf, :description, :price)
  end
end