module Viewable

  extend ActiveSupport::Concern

  included do
    def views
      View.where entity_id: self.id, entity_type: self.class
    end
  end

end