class AddAttachmentsToCopulation < ActiveRecord::Migration
  def change
    add_attachment :copulations, :prize
    add_attachment :copulations, :bloodline
    add_attachment :copulations, :mothers_photo
    add_attachment :copulations, :fathers_photo
  end
end
