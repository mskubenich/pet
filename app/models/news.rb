class News < ActiveRecord::Base
  include Commentable
  include Viewable

  belongs_to :author, class_name: User, foreign_key: :user_id
  belongs_to :category, foreign_key: :news_category_id
  has_and_belongs_to_many :categories

  has_attached_file :preview_image, :styles => { :thumb => "300x300>" }, :default_url => "/assets/missing.png"
  validates_attachment_content_type :preview_image, :content_type => /\Aimage\/.*\Z/

  validates :title_ru, presence: true
  validates :body_ru, presence: true
  validates :title_en, presence: true
  validates :body_en, presence: true
  validates :user_id, presence: true
end
