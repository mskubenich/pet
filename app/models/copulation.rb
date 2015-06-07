class Copulation < ActiveRecord::Base
  validates :family, presence: true
  validates :name, presence: true
  validates :age, presence: true
  validates :breed, presence: true
  validates :description, presence: true

  def attachments
    Attachment.where(entity_id: self.id, entity_type: Copulation)
  end

  def preview_image_url
    if attachments.any?
      attachments.first.file.url
    else
      Attachment.new.file.url
    end
  end
end
