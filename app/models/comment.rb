class Comment < ActiveRecord::Base
  belongs_to :author, class_name: User


  def commentable
    entity_type.constantize.find entity_id
  end
end
