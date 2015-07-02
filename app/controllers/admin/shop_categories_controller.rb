class Admin::ShopCategoriesController < AdminController

  # load_and_authorize_resource :shop_category

  def index
    query = ShopCategory.all
    query = query.where("title_ru LIKE ? OR title_en LIKE ?", "%#{params[:title]}%", "%#{params[:title]}%") if params[:title] && !params[:title].blank?

    @categories = query.order('id DESC').paginate page: params[:page], per_page: 9
    @count = query.count
  end

  def create
    @shop_category = ShopCategory.new category_params
    if @shop_category.save
      render json: {ok: true}
    else
      render json: {errors: @shop_category.errors}, status: :unprocessable_entity
    end
  end

  def update
    @shop_category = ShopCategory.find params[:id]
    if @shop_category.update_attributes category_params
      render json: {ok: true}
    else
      render json: {errors: @shop_category.errors}, status: :unprocessable_entity
    end
  end

  def show
    @category = ShopCategory.find params[:id]
  end

  def destroy
    @shop_category = ShopCategory.find params[:id]
    @shop_category.destroy
    render nothing: true
  end

  private

  def category_params
    params.require(:shop_category).permit(:title_ru, :title_en)
  end
end