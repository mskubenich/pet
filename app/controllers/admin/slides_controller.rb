class Admin::SlidesController < AdminController

  load_and_authorize_resource :main_slide

  def index
    @main_slides = MainSlide.paginate(page: params[:page], per_page: 10)
    @count = MainSlide.count
  end

  def destroy
    MainSlide.find(params[:id]).destroy
    render json: {ok: true}
  end

  def show

  end

  def create
    @main_slide = MainSlide.new slide_params
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