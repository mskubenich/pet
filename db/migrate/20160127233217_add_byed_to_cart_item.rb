class AddByedToCartItem < ActiveRecord::Migration
  def change
    add_column :cart_items, :byed, :string
  end
end
