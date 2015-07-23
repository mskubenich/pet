class CreateGoodHands < ActiveRecord::Migration
  def change
    create_table :good_hands do |t|
      t.string :family
      t.string :name
      t.integer :age
      t.boolean :scorp
      t.boolean :rkf
      t.text :description
      t.references :user
      t.boolean :approved
      t.string :country
      t.string :city
      t.string :sex
      t.string :color
      t.string :weight

      t.timestamps null: false
    end
  end
end
