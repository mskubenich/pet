class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.references :author
      t.references :entity
      t.string :entity_type
      t.timestamps null: false
    end
  end
end
