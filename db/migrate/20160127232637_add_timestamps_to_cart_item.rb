class AddTimestampsToCartItem < ActiveRecord::Migration
  def change
    add_column(:cart_items, :created_at, :datetime)
    add_column(:cart_items, :updated_at, :datetime)
  end
end
