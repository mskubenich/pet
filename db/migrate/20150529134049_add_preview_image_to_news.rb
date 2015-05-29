class AddPreviewImageToNews < ActiveRecord::Migration
  def up
    add_attachment :news, :preview_image
  end

  def down
    remove_attachment :news, :preview_image
  end
end
