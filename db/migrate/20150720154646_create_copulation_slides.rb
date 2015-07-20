class CreateCopulationSlides < ActiveRecord::Migration
  def change
    create_table :copulation_slides do |t|
      t.text :description
    end
    add_attachment :copulation_slides, :image
  end
end
