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
      can :manage, User do |entity|
        entity.id == user.id || entity.new_record?
      end
      can :manage, Cart do |entity|
        entity.user_id == user.id || entity.new_record?
      end
      can :manage, Post do |entity|
        entity.user_id == user.id || entity.new_record?
      end
      can :manage, MyPet do |entity|
        entity.user_id == user.id || entity.new_record?
      end
    else
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
    can :read, Post
    can :read, MyPet
    can :read, Competition
    can :read, Exhibition
  end
end
