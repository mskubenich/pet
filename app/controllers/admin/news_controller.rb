class Admin::NewsController < AdminController
  load_and_authorize_resource :news

  def index
    @news = News.paginate page: params[:page], per_page: 10
  end

  def create
    @news = News.new news_params.merge({user_id: current_user.id})
    if @news.save
      update_attachments
      render json: {id: @news.id}
    else
      render json: {errors: @news.errors}, status: :unprocessable_entity
    end
  end

  def update
    if @news.update_attributes news_params
      update_attachments
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

  def update_attachments
    Attachment.where(entity_id: nil).each do |attachment|
      if @news.body_ru.include?(attachment.file.url) || @news.body_en.include?(attachment.file.url)
        attachment.update_attribute :entity_id, @news.id
      end
    end

    Attachment.where('created_at <= :day_ago AND entity_id IS NULL', :day_ago  => 1.day.ago ).destroy_all
  end

  def news_params
    params.require(:news).permit(:title_ru, :title_en, :body_ru, :body_en, :scorp, :rkf, :preview_image)
  end
end