class AddAttachmentToPost < ActiveRecord::Migration
  def change
    add_attachment :posts, :image
  end
end