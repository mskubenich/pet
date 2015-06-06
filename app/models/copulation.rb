class Copulation < ActiveRecord::Base
  validates :family, presence: true
  validates :name, presence: true
  validates :age, presence: true
  validates :breed, presence: true
  validates :description, presence: true

end
