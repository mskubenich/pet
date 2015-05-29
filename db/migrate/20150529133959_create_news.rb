class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.text :body
      t.boolean :rkf
      t.boolean :scorp
      t.references :user

      t.timestamps null: false
    end
  end
end
