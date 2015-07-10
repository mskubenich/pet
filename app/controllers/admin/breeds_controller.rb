class Admin::BreedsController < AdminController
  load_and_authorize_resource :breed

  def index
    query = Breed.all
    query = query.where("title_ru LIKE ? OR title_en LIKE ?", "%#{params[:title]}%", "%#{params[:title]}%") if params[:title] && !params[:title].blank?

    @breeds = query.order('id DESC').paginate page: params[:page], per_page: 9
    @count = query.count
  end

  def create
    @breed = Breed.new breed_params
    if @breed.save
      render json: {ok: true}
    else
      render json: {errors: @breed.errors}, status: :unprocessable_entity
    end
  end

  def update
    if @breed.update_attributes breed_params
      render json: {ok: true}
    else
      render json: {errors: @breed.errors}, status: :unprocessable_entity
    end
  end

  def show

  end

  def destroy
    @breed.destroy
    render nothing: true
  end

  def all
    query = Breed.all
    query = query.where(family: params[:family]) if ['cat', 'dog'].include?(params[:family])
    @breeds = query.order('id DESC')
  end

  private

  def breed_params
    params.require(:breed).permit(:title_ru, :title_en, :family)
  end
end