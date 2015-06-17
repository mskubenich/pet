class Admin::CategoriesController < AdminController
  load_and_authorize_resource :category

  def index
    query = Category.all
    query = query.where(title: params[:title]) if params[:title] && !params[:title].blank?

    @categories = query.order('id DESC').paginate page: params[:page], per_page: 9
    @count = query.count
  end

  def create
    @category = Category.new category_params
    if @category.save
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