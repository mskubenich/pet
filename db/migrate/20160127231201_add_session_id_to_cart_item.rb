class AddSessionIdToCartItem < ActiveRecord::Migration
  def change
    add_column :cart_items, :session_id, :string
  end
end
