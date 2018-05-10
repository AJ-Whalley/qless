class ProfilePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    unless record == user.profile
    end 
  end 

  def new?
    user.profile.nil?
  end 

  def edit?
    record == user.profile
  end 

end
