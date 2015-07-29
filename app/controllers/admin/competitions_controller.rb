class Admin::CompetitionsController < AdminController
  load_and_authorize_resource :competition

  def index
    @competitions = Competition.paginate page: params[:page], per_page: 10
  end

  def create
    @competition = Competition.new competition_params.merge({user_id: current_user.id})
    if @competition.save
      update_attachments
      render json: {id: @competition.id}
    else
      render json: {errors: @competition.errors}, status: :unprocessable_entity
    end
  end

  def update
    if @competition.update_attributes competition_params
      update_attachments
      render json: {id: @competition.id}
    else
      render json: {errors: @competition.errors}, status: :unprocessable_entity
    end
  end

  def show

  end

  def destroy
    @competition.destroy
    render nothing: true
  end

  private

  def update_attachments
    Attachment.where(entity_id: nil, entity_type: Competition).each do |attachment|
      if @competition.body_ru.include?(attachment.file.url) || @competition.body_en.include?(attachment.file.url)
        attachment.update_attribute :entity_id, @competition.id
      end
    end

    Attachment.where('created_at <= :day_ago AND entity_id IS NULL', :day_ago  => 1.day.ago ).destroy_all
  end

  def competition_params
    params.require(:competition).permit(:title_ru, :title_en, :body_ru, :body_en, :scorp, :rkf, :preview_image)
  end
end