class Admin::OrdersController < AdminController
  load_and_authorize_resource :order

  def index
    @order = Order.paginate page: params[:page], per_page: 10
    @count = Order.count
  end

  def show

  end

  def destroy

  end
end