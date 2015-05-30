class Attachment < ActiveRecord::Base
  has_attached_file :file, :default_url => "/assets/missing.png"
  validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/
end
