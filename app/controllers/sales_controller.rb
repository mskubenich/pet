class SalesController < ApplicationController

  load_and_authorize_resource :sale
  skip_before_filter :authenticate_user, only: [:index, :show]

  def create
    attachments_params = params[:sale][:photos]
    @sale = Sale.new sale_params.merge({user_id: current_user.id})
    if @sale.save
      attachments_params.each do |attachment|
        Attachment.create entity_id: @sale.id, entity_type: Sale, file: attachment
      end
      render json: {ok: true}
    else
      render json: {errors: @sale.errors}
    end
  end

  def index
    @sales = Sale.order('created_at DESC').paginate page: params[:page], per_page: 9
    @count = Sale.count
  end

  def show

  end

  private

  def sale_params
    params.require(:sale).permit(:family, :name, :age, :breed, :scorp, :rkf, :description, :price, :photos, :prize, :bloodline, :mothers_photo, :fathers_photo)
  end
end