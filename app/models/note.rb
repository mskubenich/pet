class Note < ActiveRecord::Base
  belongs_to :user

  def ratingable
    entity_type.constantize.find entity_id
  end
end
