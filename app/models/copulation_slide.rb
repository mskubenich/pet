class CopulationSlide < ActiveRecord::Base
  has_attached_file :image, :styles => { :original => "800x800>", :thumb => "300x300>" }, :default_url => "/assets/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end