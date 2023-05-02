class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Categorie, user_id: user.id
    can :manage, Payment, user_id: user.id
  end
end
