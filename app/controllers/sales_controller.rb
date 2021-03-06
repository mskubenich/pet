class SalesController < ApplicationController

  load_and_authorize_resource :sale
  skip_before_filter :authenticate_user, only: [:index, :show]
  before_filter :calculate_view, only: [:show]

  def create
    attachments_params = params[:sale][:photos]
    @sale = Sale.new sale_params.merge({user_id: current_user.id})
    if @sale.save
      attachments_params.each do |attachment|
        Attachment.create entity_id: @sale.id, entity_type: Sale, file: attachment
      end
      render json: {id: @sale.id, ok: true}
    else
      render json: {errors: @sale.errors}, status: :unprocessable_entity
    end
  end

  def index
    query = Sale.all
    query = query.where("approved = 1 OR user_id = ?", current_user.try(:id))

    query = query.where(family: params[:family]) if params[:family] && params[:family] != 'all'
    query = query.where(sex: params[:sex]) if params[:sex] && params[:sex] != 'all'
    query = query.where("price > ?", params[:price_min]) if params[:price_min]
    query = query.where("price < ?", params[:price_max]) if params[:price_max]
    query = query.where(breed_id: params[:breed_id]) unless params[:breed_id].blank?
    query = query.where("bloodline_file_size IS NOT NULL") if params[:bloodline] == 'true'
    query = query.where(scorp: true) if params[:scorp] == 'true'
    query = query.where(rkf: true) if params[:rkf] == 'true'
    query = query.where(country_id: params[:country_id]) unless params[:country_id].blank?

    @sales = query.order('created_at DESC').paginate page: params[:page], per_page: 9
    @count = query.count
  end

  def show

  end

  def show_phone

  end

  private

  def calculate_view
    View.create entity_type: Sale, entity_id: @sale.id, ip: request.ip
  end

  def sale_params
    params.require(:sale).permit(:family, :name, :age, :breed_id, :scorp, :rkf, :description, :price, :photos, :prize, :bloodline, :mothers_photo, :fathers_photo, :country_id, :city, :sex, :color, :weight)
  end
end