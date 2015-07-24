class Admin::GoodHandsController < AdminController

  load_and_authorize_resource :good_hand

  def create
    attachments_params = params[:announcement][:photos] || []
    @good_hand = GoodHand.new hand_params.merge({user_id: current_user.id})
    if @good_hand.save
      update_attachments
      attachments_params.each do |attachment|
        Attachment.create entity_id: @good_hand.id, entity_type: GoodHand, file: attachment
      end
      render json: {ok: true}
    else
      render json: {errors: @good_hand.errors}, status: :unprocessable_entity
    end
  end

  def update
    attachments_params = params[:announcement][:photos] || []
    if @good_hand.update_attributes hand_params
      update_attachments
      attachments_params.each do |attachment|
        Attachment.create entity_id: @good_hand.id, entity_type: GoodHand, file: attachment
      end
      @good_hand.attachments.where(id: params[:announcement][:removed_photos]).destroy_all
      render json: {ok: true}
    else
      render json: {errors: @good_hand.errors}, status: :unprocessable_entity
    end
  end

  def index
    query = GoodHand.all
    query = query.where(family: params[:family]) if params[:family] && params[:family] != 'all'
    query = query.where("price > ?", params[:price_min]) if params[:price_min]
    query = query.where("price < ?", params[:price_max]) if params[:price_max]
    query = query.where(breed: params[:breed]) unless params[:breed].blank?
    query = query.where(scorp: true) if params[:scorp] == 'true'
    query = query.where(rkf: true) if params[:rkf] == 'true'

    query = query.where(approved: true) if params[:status] == 'approved'
    query = query.where(approved: [false, nil]) if params[:status] == 'not_approved'

    @good_hands = query.order('created_at DESC').paginate page: params[:page], per_page: 9
    @count = query.count
  end

  def show

  end

  def destroy
    @good_hand.destroy
    render nothing: true
  end

  def approve
    @good_hand.update_attributes approved: true, reject_reason: nil
    render json: {ok: true}
  end

  def reject
    @good_hand.update_attributes approved: false, reject_reason: params[:reason]
    render json: {ok: true}
  end

  private

  def update_attachments
    Attachment.where(entity_id: nil, entity_type: 'good_hand_description').each do |attachment|
      if @sale.description.include?(attachment.file.url)
        attachment.update_attribute :entity_id, @sale.id
      end
    end

    Attachment.where('created_at <= :day_ago AND entity_id IS NULL', :day_ago  => 1.day.ago ).destroy_all
  end

  def hand_params
    params.require(:announcement).permit(:family, :name, :age, :breed_id, :scorp, :rkf, :description, :photos, :prize, :bloodline, :mothers_photo, :fathers_photo, :sex, :country, :city, :color, :weight)
  end
end