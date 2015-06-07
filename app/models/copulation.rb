class Copulation < ActiveRecord::Base
  validates :family, presence: true
  validates :name, presence: true
  validates :age, presence: true
  validates :breed, presence: true
  validates :description, presence: true

  has_attached_file :prize, :default_url => "/assets/missing.png"
  validates_attachment_content_type :prize, :content_type => /\Aimage\/.*\Z/
  has_attached_file :bloodline, :default_url => "/assets/missing.png"
  validates_attachment_content_type :bloodline, :content_type => /\Aimage\/.*\Z/
  has_attached_file :mothers_photo, :default_url => "/assets/missing.png"
  validates_attachment_content_type :mothers_photo, :content_type => /\Aimage\/.*\Z/
  has_attached_file :fathers_photo, :default_url => "/assets/missing.png"
  validates_attachment_content_type :fathers_photo, :content_type => /\Aimage\/.*\Z/

  belongs_to :owner, class_name: User, foreign_key: 'user_id'

  def attachments
    Attachment.where(entity_id: self.id, entity_type: Copulation)
  end

  def preview_images_url
    if attachments.any?
      attachments.map{|a| a.file.url }
    else
      [Attachment.new.file.url]
    end
  end

  def preview_image_url
    if attachments.any?
      attachments.first.file.url
    else
      Attachment.new.file.url
    end
  end
end
