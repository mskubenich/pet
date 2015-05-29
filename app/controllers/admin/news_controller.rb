class Admin::NewsController < AdminController
  load_and_authorize_resource :news

  def index
    @news = News.all
  end

  def create
    @news = News.new news_params.merge({user_id: current_user.id})
    if @news.save
      render json: {id: @news.id}
    else
      render json: {errors: @news.errors}, status: :unprocessable_entity
    end
  end

  def upload_preview_image

  end

  private

  def news_params
    params.require(:news).permit(:title, :body, :scorp, :rkf)
  end
end