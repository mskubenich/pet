class OrderController < ApplicationController
  def create
    order = Order.new order_params
    order.user = current_user
    order.save
    current_user.cart.cart_items.each do |cart_item|
      order.order_items.create product_id: cart_item.product_id,
                               title: cart_item.product.try(:title),
                               price: cart_item.product.try(:price),
                               count: cart_item.product.try(:count)
    end
    render json: params
  end

  private

  def order_params
    params.require(:order).permit :first_name, :last_name, :email, :phone, :country, :city, :street, :zip
  end
end