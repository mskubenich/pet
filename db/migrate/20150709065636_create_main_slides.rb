class CreateMainSlides < ActiveRecord::Migration
  def change
    create_table :main_slides do |t|
      t.text :description
    end
  end
end
