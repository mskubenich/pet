class MainSlide < ActiveRecord::Base
  has_attached_file :image, :styles => { :original => "1500x1500>", :thumb => "100x100>" }, :default_url => "/assets/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
