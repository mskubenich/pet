class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user
      t.string :city
      t.string :country
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :street
      t.string :zip
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
