class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user
    end
    create_table :order_items do |t|
      t.references :order
      t.references :product
      t.string :title
      t.integer :price
      t.integer :count
    end
  end
end
