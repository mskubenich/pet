class Breed < ActiveRecord::Base
  validates :title_ru, presence: true, uniqueness: true
  validates :title_en, presence: true, uniqueness: true
end
