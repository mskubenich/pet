class OrderController < ApplicationController
  skip_before_filter :authenticate_user
  def create
    order = Order.new order_params
    order.user = current_user
    order.save

    if current_user
      @cart_items = CartItem.where(cart_id: current_user.cart.id)
    else
      @cart_items = CartItem.where(session_id: session[:session_id])
    end

    @cart_items.each do |cart_item|
      OrderItem.create product_id: cart_item.product_id,
                       title: cart_item.product.try(:title),
                       price: cart_item.product.try(:price),
                       count: cart_item.count,
                       order_id: order.id
      cart_item.destroy
      current_user.cart.destroy if current_user
    end
    render json: params
  end

  private

  def order_params
    params.require(:order).permit :first_name, :last_name, :email, :phone, :country, :city, :street, :zip
  end
end