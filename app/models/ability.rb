class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    alias_action :create, :read, :update, :destroy, to: :crud
    alias_action :index, :show, to: :readonly
    alias_action :create, :read, :update, :index, to: :crui
    alias_action :create, :read, :index, to: :cri
    alias_action :read, :index, :show, to: :ris

    if user.admin?
      can :manage, :all  
    else
      can :readonly, :all
    end

  end
end
