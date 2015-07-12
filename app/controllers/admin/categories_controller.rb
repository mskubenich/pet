class Admin::CategoriesController < AdminController
  load_and_authorize_resource :category

  def index
    query = Category.all
    query = query.where("title_ru LIKE ? OR title_en LIKE ?", "%#{params[:title]}%", "%#{params[:title]}%") if params[:title] && !params[:title].blank?

    @categories = query.order('id DESC').paginate page: params[:page], per_page: 9
    @count = query.count
  end

  def titles
    @categories = Category.all
  end

  def create
    @category = Category.new category_params
    if @category.save
      render json: {ok: true}
    else
      render json: {errors: @category.errors}, status: :unprocessable_entity
    end
  end

  def update
    if @category.update_attributes category_params
      render json: {ok: true}
    else
      render json: {errors: @category.errors}, status: :unprocessable_entity
    end
  end

  def show

  end

  def destroy
    @category.destroy
    render nothing: true
  end

  private

  def category_params
    params.require(:category).permit(:title_ru, :title_en)
  end
end