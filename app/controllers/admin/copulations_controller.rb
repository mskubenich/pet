class Admin::CopulationsController < AdminController

  load_and_authorize_resource :copulation

  def create
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
    params.require(:copulation).permit(:family, :name, :age, :breed, :skorp, :rkf, :description, :price)
  end

  def attachments_params
    params.require(:copulation).permit(:photos)
  end
end