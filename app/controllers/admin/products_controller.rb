class Admin::ProductsController < AdminController

  load_and_authorize_resource :product

  def create
    attachments_params = params[:product][:photos] || []
    @product = Product.new product_params
    if @product.save
      update_attachments
      attachments_params.each do |attachment|
        Attachment.create entity_id: @product.id, entity_type: Product, file: attachment
      end
      render json: {ok: true}
    else
      render json: {errors: @product.errors}
    end
  end

  def update
    attachments_params = params[:product][:photos] || []
    if @product.update_attributes product_params
      update_attachments
      attachments_params.each do |attachment|
        Attachment.create entity_id: @product.id, entity_type: Product, file: attachment
      end
      @product.attachments.where(id: params[:product][:removed_photos]).destroy_all
      render json: {ok: true}
    else
      render json: {errors: @product.errors}
    end
  end

  def index
    query = Product.all
    query = query.where(family: params[:family]) if params[:family] && params[:family] != 'all'
    query = query.where("price > ?", params[:price_min]) if params[:price_min]
    query = query.where("price < ?", params[:price_max]) if params[:price_max]

    @products = query.order('created_at DESC').paginate page: params[:page], per_page: 9
    @count = query.count
  end

  def show

  end

  def destroy
    @product.destroy
    render nothing: true
  end

  def approve
    @product.update_attributes approved: true, reject_reason: nil
    render json: {ok: true}
  end

  def reject
    @product.update_attributes approved: false, reject_reason: params[:reason]
    render json: {ok: true}
  end

  private

  def update_attachments
    Attachment.where('created_at <= :day_ago AND entity_id IS NULL', :day_ago  => 1.day.ago ).destroy_all
  end

  def product_params
    params.require(:product).permit(:family, :title, :description, :price)
  end
end