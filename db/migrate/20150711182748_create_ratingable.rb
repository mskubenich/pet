class CreateRatingable < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :points
      t.references :user
      t.references :entity
      t.string :entity_type
    end
  end
end
