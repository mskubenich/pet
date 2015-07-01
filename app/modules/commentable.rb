module Commentable

  extend ActiveSupport::Concern

  included do
    def comments
      Comment.where entity_id: self.id, entity_type: self.class
    end
  end

end