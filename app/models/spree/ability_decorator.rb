class AbilityDecorator
  include CanCan::Ability
  def initialize(user)
    #can [:read, :index], Spree::NewsEntry

    if user.respond_to?(:has_spree_role?) && user.has_spree_role?('admin')
      can [:admin, :index, :read, :update, :edit], Spree::AddOnMall
      can [:admin, :index, :read, :update, :edit], Spree::AddOnMallPrice
    end
  end
end

Spree::Ability.register_ability(AbilityDecorator)