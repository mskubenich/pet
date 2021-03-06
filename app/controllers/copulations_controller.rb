class CopulationsController < ApplicationController

  load_and_authorize_resource :copulation
  skip_before_filter :authenticate_user, only: [:index, :show]
  before_filter :calculate_view, only: [:show]

  def create
    attachments_params = params[:copulation][:photos].delete_if{|i| !i.is_a?(ActionDispatch::Http::UploadedFile) } || []
    @copulation = Copulation.new copulation_params.merge({user_id: current_user.id})
    if @copulation.save
      update_attachments
      attachments_params.each do |attachment|
        Attachment.create entity_id: @copulation.id, entity_type: Copulation, file: attachment
      end
      render json: {id: @copulation.id, ok: true}
    else
      render json: {errors: @copulation.errors}, status: :unprocessable_entity
    end
  end

  def index
    query = Copulation.all
    query = query.where("approved = 1 OR user_id = ?", current_user.try(:id))
    query = query.where(family: params[:family]) if params[:family] && params[:family] != 'all'
    query = query.where("price > ?", params[:price_min]) if params[:price_min]
    query = query.where("price < ?", params[:price_max]) if params[:price_max]
    query = query.where(breed_id: params[:breed_id]) unless params[:breed_id].blank?
    query = query.where("bloodline_file_size IS NOT NULL") if params[:bloodline] == 'true'
    query = query.where(scorp: true) if params[:scorp] == 'true'
    query = query.where(rkf: true) if params[:rkf] == 'true'
    query = query.where(country_id: params[:country_id]) unless params[:country_id].blank?
    query = query.where(sex: params[:sex]) if params[:sex] && params[:sex] != 'all'

    @copulations = query.order('created_at DESC').paginate page: params[:page], per_page: 9
    @count = query.count
  end

  def show

  end

  def show_phone

  end

  private

  def calculate_view
    View.create entity_type: Copulation, entity_id: @copulation.id, ip: request.ip
  end

  def update_attachments
    Attachment.where(entity_id: nil, entity_type: 'copulation_description').each do |attachment|
      if @copulation.description.include?(attachment.file.url)
        attachment.update_attribute :entity_id, @copulation.id
      end
    end

    Attachment.where('created_at <= :day_ago AND entity_id IS NULL', :day_ago  => 1.day.ago ).destroy_all
  end

  def copulation_params
    params.require(:copulation).permit(:family, :name, :age, :breed_id, :scorp, :rkf, :description, :price, :prize, :bloodline, :mothers_photo, :fathers_photo, :country_id, :city, :sex, :color, :weight)
  end
end