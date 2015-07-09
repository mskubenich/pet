class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :family
      t.string :name
      t.integer :age
      t.boolean :scorp
      t.boolean :rkf
      t.text :description
      t.integer :price
      t.references :user
      t.boolean :approved

      t.timestamps null: false
      t.timestamps null: false
    end
  end
end
