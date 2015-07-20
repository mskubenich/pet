class CreateMyPets < ActiveRecord::Migration
  def change
    create_table :my_pets do |t|
      t.string :name
      t.references :breed
      t.references :user
      t.string :family
      t.timestamps null: false
    end
  end
end
