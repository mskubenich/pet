class CreateGoodHands < ActiveRecord::Migration
  def change
    create_table :good_hands do |t|
      t.string :family
      t.string :name
      t.integer :age
      t.string :breed
      t.boolean :scorp
      t.boolean :rkf
      t.text :description
      t.references :user
      t.boolean :approved

      t.timestamps null: false
    end
  end
end
