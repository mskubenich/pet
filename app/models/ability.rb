class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      if user.admin?
        can :manage, :all
      end
      if user.user?
        can :manage, User do |entity|
          user.id == entity.id
        end
        can :read, Role
        can :manage, Session do |session|
          session.user.id == user.id
        end
      end
    else
      can :manage, User do |entity|
        entity.new_record?
      end
    end
    can :read, News
  end
end
