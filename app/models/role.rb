class Role < ActiveRecord::Base
  has_and_belongs_to_many :users

  def self.admin
    where(name: 'admin').first_or_create
  end

  def self.user
    where(name: 'user').first_or_create
  end
end
