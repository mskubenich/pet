class MyPet < ActiveRecord::Base
  belongs_to :user
  belongs_to :breed

  after_destroy :destroy_attachments

  def attachments
    Attachment.where(entity_id: self.id, entity_type: MyPet)
  end

  def preview_images_url
    if attachments.any?
      attachments.map{|a| {id: a.id, url: a.file.url} }
    else
      [{id: nil, url: Attachment.new.file.url}]
    end
  end

  def preview_image_url
    preview_image.file.url
  end

  def preview_image
    if attachments.any?
      attachments.first
    else
      Attachment.new
    end
  end

  private

  def destroy_attachments
    attachments.destroy_all
  end
end
