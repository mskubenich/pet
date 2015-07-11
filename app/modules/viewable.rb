module Viewable

  extend ActiveSupport::Concern

  included do
    def views
      View.where entity_id: self.id, entity_type: self.class
    end

    def self.popular(count)
      all.order('views_count DESC').limit(count)
    end
  end

end