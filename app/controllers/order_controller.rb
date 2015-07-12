class OrderController < ApplicationController
  def create
    order = Order.new order_params
    order.user = current_user
    order.save
    current_user.cart.cart_items.each do |cart_item|
      OrderItem.create product_id: cart_item.product_id,
                       title: cart_item.product.try(:title),
                       price: cart_item.product.try(:price),
                       count: cart_item.count,
                       order_id: order.id
      current_user.cart.destroy
    end
    render json: params
  end

  private

  def order_params
    params.require(:order).permit :first_name, :last_name, :email, :phone, :country, :city, :street, :zip
  end
end