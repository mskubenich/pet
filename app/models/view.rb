class View < ActiveRecord::Base

  before_validation :check_ip
  after_create :update_count

  def viewable
    entity_type.constantize.find entity_id
  end

  private

  def check_ip
    if View.where(entity_type: entity_type, entity_id: entity_id, ip: ip).where("created_at > ?", Time.now - 3.hours).count > 0
      self.errors.add :base, 'Already calculated'
    end
  end

  def update_count
    viewable.update_attribute :views_count, viewable.views.count
  end
end
