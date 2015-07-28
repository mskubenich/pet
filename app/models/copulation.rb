class Copulation < ActiveRecord::Base
  include Commentable
  include Viewable
  include Ratingable

  validates :family, presence: true
  validates :name, presence: true
  validates :age, presence: true
  validates :breed, presence: true
  validates :description, presence: true
  validates :country_id, presence: true
  validates :city, presence: true
  validates :sex, presence: true
  validates :color, presence: true
  validates :weight, presence: true

  has_attached_file :prize, :default_url => "/assets/missing.png"
  validates_attachment_content_type :prize, content_type: [/\Aimage\/.*\Z/, 'application/pdf', /text\/*/, "application/vnd.ms-excel", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "application/msword"]
  validates_attachment_size :prize, :less_than => 10.megabytes.to_i, if: Proc.new {|model| model.prize }

  has_attached_file :mothers_photo, :default_url => "/assets/missing.png"
  validates_attachment_content_type :mothers_photo, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :mothers_photo, :less_than => 10.megabytes.to_i, if: Proc.new {|model| model.mothers_photo }

  has_attached_file :fathers_photo, :default_url => "/assets/missing.png"
  validates_attachment_content_type :fathers_photo, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :fathers_photo, :less_than => 10.megabytes.to_i, if: Proc.new {|model| model.fathers_photo }

  has_attached_file :bloodline, :default_url => "/assets/missing.png"
  validates_attachment_content_type :bloodline, content_type: [/\Aimage\/.*\Z/, 'application/pdf', /text\/*/, "application/vnd.ms-excel", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "application/msword"]
  validates_attachment_size :bloodline, :less_than => 10.megabytes.to_i, if: Proc.new {|model| model.bloodline }

  belongs_to :owner, class_name: User, foreign_key: 'user_id'
  belongs_to :breed

  after_destroy :destroy_attachments

  def attachments
    Attachment.where(entity_id: self.id, entity_type: Copulation)
  end

  def redactor_attachments
    Attachment.where(entity_id: self.id, entity_type: 'copulation_description')
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

  def preview_text
    f = Nokogiri::XML.fragment(description[0..100])

    f.search('.//img').remove
    f.to_html
  end

  def preview_text_only(length)
    f = Nokogiri::XML.fragment(description[0..length])

    f.search('.//img').remove
    f.text
  end

  private

  def destroy_attachments
    attachments.destroy_all
    redactor_attachments.destroy_all
  end
end
