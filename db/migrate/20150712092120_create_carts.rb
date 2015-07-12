class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :user_id
    end

    create_table :cart_items do |t|
      t.references :cart
      t.references :product
      t.integer :count
    end
  end
end
