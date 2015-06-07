class CopulationsController < ApplicationController

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
    @copulations = Copulation.order('created_at DESC').paginate page: params[:page], per_page: 9
    @count = Copulation.count
  end

  def show

  end

  private

  def copulation_params
    params.require(:copulation).permit(:family, :name, :age, :breed, :scorp, :rkf, :description, :price, :photos, :prize, :bloodline, :mothers_photo, :fathers_photo)
  end
end