class Post < ActiveRecord::Base
  has_attached_file :image, :styles => { :thumb => "300x300>" }, :default_url => "/assets/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates :title, presence: true
  validates :body, presence: true

  belongs_to :user
end
