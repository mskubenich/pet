class CopulationsController < ApplicationController

  load_and_authorize_resource :copulation

  def create
    attachments_params = params[:copulation][:photos]
    @copulation = Copulation.new copulation_params
    if @copulation.save
      attachments_params.each do |attachment|
        Attachment.create entity_id: @copulation.id, entity_type: Copulation, file: attachment
      end
      render json: {ok: true}
    else
      render json: {errors: @copulation.errors}
    end
  end

  private

  def copulation_params
    params.require(:copulation).permit(:family, :name, :age, :breed, :scorp, :rkf, :description, :price, :photos)
  end
end