class Admin::ExhibitionsController < AdminController
  load_and_authorize_resource :exhibition

  def index
    @exhibitions = Exhibition.paginate page: params[:page], per_page: 10
  end

  def create
    @exhibition = Exhibition.new exhibition_params.merge({user_id: current_user.id})
    if @exhibition.save
      update_attachments
      render json: {id: @exhibition.id}
    else
      render json: {errors: @exhibition.errors}, status: :unprocessable_entity
    end
  end

  def update
    if @exhibition.update_attributes exhibition_params
      update_attachments
      render json: {id: @exhibition.id}
    else
      render json: {errors: @exhibition.errors}, status: :unprocessable_entity
    end
  end

  def show

  end

  def destroy
    @exhibition.destroy
    render nothing: true
  end

  private

  def update_attachments
    Attachment.where(entity_id: nil, entity_type: Exhibition).each do |attachment|
      if @exhibition.body_ru.include?(attachment.file.url) || @exhibition.body_en.include?(attachment.file.url)
        attachment.update_attribute :entity_id, @exhibition.id
      end
    end

    Attachment.where('created_at <= :day_ago AND entity_id IS NULL', :day_ago  => 1.day.ago ).destroy_all
  end

  def exhibition_params
    params.require(:exhibition).permit(:title_ru, :title_en, :body_ru, :body_en, :scorp, :rkf, :preview_image)
  end
end