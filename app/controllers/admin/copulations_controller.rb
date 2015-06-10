class Admin::CopulationsController < AdminController

  load_and_authorize_resource :copulation
  skip_before_filter :authenticate_user, only: [:index, :show]

  def create
    attachments_params = params[:copulation][:photos]
    @copulation = Copulation.new copulation_params.merge({user_id: current_user.id})
    if @copulation.save
      attachments_params.each do |attachment|
        Attachment.create entity_id: @copulation.id, entity_type: Copulation, file: attachment
      end
      render json: {ok: true}
    else
      render json: {errors: @copulation.errors}
    end
  end

  def index
    query = Copulation.all
    query = query.where(family: params[:family]) if params[:family] && params[:family] != 'all'
    query = query.where("price > ?", params[:price_min]) if params[:price_min]
    query = query.where("price < ?", params[:price_max]) if params[:price_max]
    query = query.where(breed: params[:breed]) unless params[:breed].blank?
    query = query.where("bloodline_file_size IS NOT NULL") if params[:bloodline] == 'true'
    query = query.where(scorp: true) if params[:scorp] == 'true'
    query = query.where(rkf: true) if params[:rkf] == 'true'

    @copulations = query.order('created_at DESC').paginate page: params[:page], per_page: 9
    @count = query.count
  end

  def show

  end

  private

  def copulation_params
    params.require(:copulation).permit(:family, :name, :age, :breed, :scorp, :rkf, :description, :price, :photos, :prize, :bloodline, :mothers_photo, :fathers_photo)
  end
end