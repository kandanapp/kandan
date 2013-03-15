#==============================================================================
# This file is part of Kandan.
# https://github.com/kandanapp/kandan
#
# Kandan's code and assets are dual-licensed. Kandan is available
# generally under the AGPL, and also under a custom license via
# special agreement. See LICENSE for the AGPL terms, and contact us
# at <admin@kandanapp.com> if you're interested in development of
# Kandan under a custom license.
#==============================================================================
class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is_admin
      can :manage, :all
    else
      can [:read, :create], Channel
      can :manage, Channel, :user => user
      can :manage, User, :id => user.id # can manage themselves
    end
    can :read, User
    # This goes last in order to override all other permissions.
    cannot :destroy, Channel, :id => 1
  end
end
