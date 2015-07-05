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
        can :manage, Copulation do |copulation|
          copulation.new_record? || copulation.owner.id == user.id
        end
        can :manage, Sale do |sale|
          sale.new_record? || sale.owner.id == user.id
        end
      end
      can :create, Comment
    else
      can :manage, User do |entity|
        entity.new_record?
      end
    end
    can :read, News
    can :read, Copulation
    can :read, Sale
    can :read, Comment
    can :read, GoodHand
    can :read, Breed
    can :read, Category
    can :read, ShopCategory
    can :read, ShopSubcategory
    can :read, Product
  end
end
