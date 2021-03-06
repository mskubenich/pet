class GoodHandsController < ApplicationController

  load_and_authorize_resource :good_hand
  skip_before_filter :authenticate_user, only: [:index, :show]
  before_filter :calculate_view, only: [:show]

  def create
    attachments_params = params[:announcement][:photos]
    @good_hand = GoodHand.new good_hands_params.merge({user_id: current_user.id})
    if @good_hand.save
      attachments_params.each do |attachment|
        Attachment.create entity_id: @good_hand.id, entity_type: GoodHand, file: attachment
      end
      render json: {ok: true, id: @good_hand.id}
    else
      render json: {errors: @good_hand.errors}, status: :unprocessable_entity
    end
  end

  def index
    query = GoodHand.all
    query = query.where("approved = 1 OR user_id = ?", current_user.try(:id))

    query = query.where(family: params[:family]) if params[:family] && params[:family] != 'all'
    query = query.where(breed_id: params[:breed_id]) unless params[:breed_id].blank?
    query = query.where("bloodline_file_size IS NOT NULL") if params[:bloodline] == 'true'
    query = query.where(scorp: true) if params[:scorp] == 'true'
    query = query.where(rkf: true) if params[:rkf] == 'true'
    query = query.where(country_id: params[:country_id]) unless params[:country_id].blank?
    query = query.where(sex: params[:sex]) if params[:sex] && params[:sex] != 'all'

    @good_hands = query.order('created_at DESC').paginate page: params[:page], per_page: 9
    @count = query.count
  end

  def show

  end

  def show_phone

  end

  private

  def calculate_view
    View.create entity_type: GoodHand, entity_id: @good_hand.id, ip: request.ip
  end

  def good_hands_params
    params.require(:announcement).permit(:family, :name, :age, :breed_id, :scorp, :rkf, :description, :photos, :prize, :bloodline, :mothers_photo, :fathers_photo, :country_id, :city, :sex, :color, :weight)
  end
end