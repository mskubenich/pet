class AddAttachmentsToCompetitionsAndExhibitions < ActiveRecord::Migration
  def up
    add_attachment :exhibitions, :preview_image
    add_attachment :competitions, :preview_image
  end

  def down
    remove_attachment :exhibitions, :preview_image
    remove_attachment :competitions, :preview_image
  end
end
