class News < ActiveRecord::Base
  belongs_to :author, class_name: News, foreign_key: :user_id
  has_attached_file :preview_image, :styles => { :original => "300x300>" }, :default_url => "/assets/missing.png"
  validates_attachment_content_type :preview_image, :content_type => /\Aimage\/.*\Z/

  validates :title_ru, presence: true
  validates :body_ru, presence: true
  validates :title_en, presence: true
  validates :body_en, presence: true
  validates :user_id, presence: true
end
