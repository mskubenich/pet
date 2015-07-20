class Admin::CopulationSlidesController < AdminController

  load_and_authorize_resource :main_slide

  def index
    @main_slides = CopulationSlide.paginate(page: params[:page], per_page: 10)
    @count = CopulationSlide.count
  end

  def destroy
    CopulationSlide.find(params[:id]).destroy
    render json: {ok: true}
  end

  def show

  end

  def create
    @main_slide = CopulationSlide.new slide_params
    if @main_slide.save
      render json: {ok: true}
    else
      render json: {errors: @main_slide.errors}
    end
  end

  private

  def slide_params
    params.require(:main_slide).permit(:image)
  end
end