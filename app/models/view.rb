class View < ActiveRecord::Base

  before_validation :check_ip

  def viewable
    entity_type.constantize.find entity_id
  end

  private

  def check_ip
    if View.where(entity_type: entity_type, entity_id: entity_id, ip: ip).where("created_at > ?", Time.now - 3.hours).count > 0
      self.errors.add :base, 'Already calculated'
    end
  end
end
