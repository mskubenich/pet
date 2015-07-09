class AddImageToSlides < ActiveRecord::Migration
  def change
    add_attachment :main_slides, :image
  end
end
