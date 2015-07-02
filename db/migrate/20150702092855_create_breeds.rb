class CreateBreeds < ActiveRecord::Migration
  def change
    create_table :breeds do |t|
      t.string :title_ru
      t.string :title_en
      t.string :family
    end
    add_column :copulations, :breed_id, :integer
    add_column :sales, :breed_id, :integer
    add_column :good_hands, :breed_id, :integer
  end
end