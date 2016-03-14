class ProductsController < ApplicationController

  load_and_authorize_resource :product
  skip_before_filter :authenticate_user, only: [:index, :show]
  before_filter :calculate_view, only: [:show]

  def index
    query = Product.all

    query = query.where(products: {family: params[:family]}) if params[:family] && params[:family] != 'all'
    query = query.where("products.price > ?", params[:price_min])
    query = query.where("products.price < ?", params[:price_max])
    query = query.where(shop_subcategory_id: params[:shop_subcategory_id]) unless params[:shop_subcategory_id].blank?

    @products = query.order('id DESC').paginate page: params[:page], per_page: 13
    @products = (@products * 13)[0..12] if @products.count < 13 && @products.count > 0
    @count = query.count
    @new_product = Product.order('created_at DESC').limit(5).sample
  end

  def show

  end

  private
  def calculate_view
    View.create entity_type: Product, entity_id: @product.id, ip: request.ip
  end

  def product_params
    params.require(:sale).permit(:family, :name, :age, :breed, :scorp, :rkf, :description, :price, :photos, :prize, :bloodline, :mothers_photo, :fathers_photo)
  end
end