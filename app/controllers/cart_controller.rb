class CartController < ApplicationController

  skip_before_filter :authenticate_user

  def add

    product = Product.find params[:product_id]

    if current_user
      @cart_item = CartItem.where(cart_id: current_user.cart.id, product_id: product.id).first_or_create
    else
      @cart_item = CartItem.where(session_id: session[:session_id], product_id: product.id).first_or_create
    end
    @cart_item.update_attribute :count, @cart_item.count ? (@cart_item.count + 1) : 1

    render json: {ok: true}
  end

  def set_count
    CartItem.find(params[:cart_item_id]).update_attribute :count, params[:count]
    render json: {ok: true}
  end

  def index
    @cart_items = current_user ? current_user.cart.cart_items : CartItem.where(session_id: session[:session_id])

    @total_price = @cart_items.map{|i| i.count * i.product.try(:price).to_i }.sum
  end

  def destroy
    CartItem.find(params[:id]).destroy
    render json: {ok: true}
  end
end