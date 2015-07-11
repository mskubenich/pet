class CreateView < ActiveRecord::Migration
  def change
    create_table :views do |t|
      t.references :entity
      t.string :entity_type
      t.string :ip
      t.timestamps null: false
    end
  end
end
