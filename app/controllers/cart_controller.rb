class CartController < ApplicationController

  def add
    count = current_user.cart.cart_items.where(product_id: params[:product_id]).count
    product = Product.find params[:product_id]
    current_user.cart.cart_items.create count: count + 1, product_id: product.id
    render json: {ok: true}
  end

  def set_count
    CartItem.find(params[:cart_item_id]).update_attribute :count, params[:count]
    render json: {ok: true}
  end

  def index
    @cart_items = current_user.cart.cart_items

    @total_price = @cart_items.map{|i| i.count * i.product.try(:price).to_i }.sum
  end

  def destroy
    CartItem.find(params[:id]).destroy
    render json: {ok: true}
  end
end