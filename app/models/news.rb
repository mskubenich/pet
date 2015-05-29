class News < ActiveRecord::Base
  belongs_to :author, class_name: News, foreign_key: :user_id
  has_attached_file :preview_image, :styles => { :original => "300x300>" }
  validates_attachment_content_type :preview_image, :content_type => /\Aimage\/.*\Z/

  validates :title, presence: true
  validates :body, presence: true
  validates :user_id, presence: true
end
