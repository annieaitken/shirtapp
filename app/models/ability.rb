class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged on)
    can :manage, User, id: user.id
  end
end
