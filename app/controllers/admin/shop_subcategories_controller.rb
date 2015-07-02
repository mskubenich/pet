class Admin::ShopSubcategoriesController < AdminController

  # load_and_authorize_resource :shop_subcategory

  def index
    @shop_category = ShopCategory.find params[:shop_category_id]
    query = @shop_category.shop_subcategories
    query = query.where("title_ru LIKE ? OR title_en LIKE ?", "%#{params[:title]}%", "%#{params[:title]}%") if params[:title] && !params[:title].blank?

    @categories = query.order('id DESC').paginate page: params[:page], per_page: 9
    @count = query.count
  end

  def create
    @shop_category = ShopCategory.find params[:shop_category_id]
    @shop_subcategory = ShopSubcategory.new category_params
    @shop_subcategory.shop_category_id = @shop_category.id
    if @shop_subcategory.save
      render json: {ok: true}
    else
      render json: {errors: @shop_subcategory.errors}, status: :unprocessable_entity
    end
  end

  def update
    @shop_category = ShopCategory.find params[:shop_category_id]
    @shop_subcategory = ShopSubcategory.find params[:id]
    if @shop_subcategory.update_attributes category_params
      render json: {ok: true}
    else
      render json: {errors: @shop_subcategory.errors}, status: :unprocessable_entity
    end
  end

  def show
    @shop_category = ShopCategory.find params[:shop_category_id]
    @category = ShopSubcategory.find params[:id]
  end

  def destroy
    @shop_category = ShopCategory.find params[:shop_category_id]
    @shop_subcategory = ShopSubcategory.find params[:id]
    @shop_subcategory.destroy
    render nothing: true
  end

  private

  def category_params
    params.require(:shop_subcategory).permit(:title_ru, :title_en)
  end
end