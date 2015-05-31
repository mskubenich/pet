class Admin::NewsController < AdminController
  load_and_authorize_resource :news

  def index
    @news = News.paginate page: params[:page], per_page: 10
  end

  def create
    @news = News.new news_params.merge({user_id: current_user.id})
    if @news.save
      render json: {id: @news.id}
    else
      render json: {errors: @news.errors}, status: :unprocessable_entity
    end
  end

  def update
    if @news.update_attributes news_params
      render json: {id: @news.id}
    else
      render json: {errors: @news.errors}, status: :unprocessable_entity
    end
  end

  def show

  end

  def destroy
    @news.destroy
    render nothing: true
  end

  private

  def news_params
    params.require(:news).permit(:title_ru, :title_en, :body_ru, :body_en, :scorp, :rkf, :preview_image)
  end
end