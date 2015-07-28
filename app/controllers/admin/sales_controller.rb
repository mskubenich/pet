class Admin::SalesController < AdminController

  load_and_authorize_resource :sale

  def create
    attachments_params = params[:sale][:photos] || []
    @sale = Sale.new sale_params.merge({user_id: current_user.id})
    if @sale.save
      update_attachments
      attachments_params.each do |attachment|
        Attachment.create entity_id: @sale.id, entity_type: Sale, file: attachment
      end
      render json: {ok: true}
    else
      render json: {errors: @sale.errors}, status: :unprocessable_entity
    end
  end

  def update
    attachments_params = params[:sale][:photos] || []
    if @sale.update_attributes sale_params
      update_attachments
      attachments_params.each do |attachment|
        Attachment.create entity_id: @sale.id, entity_type: Sale, file: attachment
      end
      @sale.attachments.where(id: params[:sale][:removed_photos]).destroy_all
      render json: {ok: true}
    else
      render json: {errors: @sale.errors}, status: :unprocessable_entity
    end
  end

  def index
    query = Sale.all
    query = query.where(family: params[:family]) if params[:family] && params[:family] != 'all'
    query = query.where(sex: params[:sex]) if params[:sex] && params[:sex] != 'all'
    query = query.where("price > ?", params[:price_min]) if params[:price_min]
    query = query.where("price < ?", params[:price_max]) if params[:price_max]
    query = query.where(breed_id: params[:breed_id]) unless params[:breed_id].blank?
    query = query.where("bloodline_file_size IS NOT NULL") if params[:bloodline] == 'true'
    query = query.where(scorp: true) if params[:scorp] == 'true'
    query = query.where(rkf: true) if params[:rkf] == 'true'
    query = query.where(country_id: params[:country_id]) unless params[:country_id].blank?

    query = query.where(approved: true) if params[:status] == 'approved'
    query = query.where(approved: [false, nil]) if params[:status] == 'not_approved'

    @sales = query.order('created_at DESC').paginate page: params[:page], per_page: 9
    @count = query.count
  end

  def show

  end

  def destroy
    @sale.destroy
    render nothing: true
  end

  def approve
    @sale.update_attributes approved: true, reject_reason: nil
    render json: {ok: true}
  end

  def reject
    @sale.update_attributes approved: false, reject_reason: params[:reason]
    render json: {ok: true}
  end

  private

  def update_attachments
    Attachment.where(entity_id: nil, entity_type: 'sale_description').each do |attachment|
      if @sale.description.include?(attachment.file.url)
        attachment.update_attribute :entity_id, @sale.id
      end
    end

    Attachment.where('created_at <= :day_ago AND entity_id IS NULL', :day_ago  => 1.day.ago ).destroy_all
  end

  def sale_params
    params.require(:sale).permit(:family, :name, :age, :breed_id, :scorp, :rkf, :description, :price, :photos, :prize,
                                 :bloodline, :mothers_photo, :fathers_photo, :sex, :country_id, :city, :color, :weight)
  end
end