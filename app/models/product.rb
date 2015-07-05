class Product < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :family, presence: true

  after_destroy :destroy_attachments

  def attachments
    Attachment.where(entity_id: self.id, entity_type: Product)
  end

  def preview_images_url
    if attachments.any?
      attachments.map{|a| {id: a.id, url: a.file.url} }
    else
      [{id: nil, url: Attachment.new.file.url}]
    end
  end

  def preview_image_url
    if attachments.any?
      attachments.first.file.url(:thumb)
    else
      Attachment.new.file.url
    end
  end

  def preview_text
    description[0..24] + '...'
  end

  private

  def destroy_attachments
    attachments.destroy_all
  end
end
