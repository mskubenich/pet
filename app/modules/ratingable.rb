module Ratingable

  extend ActiveSupport::Concern

  included do
    def rating
      notes.count > 0 ? @notes = notes.map(&:points).compact.reject(&:blank?).sum / notes.count : 0
    end

    def notes
      Note.where(entity_id: self.id, entity_type: self.class)
    end

    def voices_count
      notes.count
    end

    def noted(user)
      user && notes.where(user_id: user.id).count > 0
    end
  end

end