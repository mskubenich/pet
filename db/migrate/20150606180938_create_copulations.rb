class CreateCopulations < ActiveRecord::Migration
  def change
    create_table :copulations do |t|
      t.string :family
      t.string :name
      t.integer :age
      t.string :breed
      t.boolean :scorp
      t.boolean :rkf
      t.text :description
      t.integer :price

      t.timestamps null: false
    end
  end
end
