class JobPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end


  def edit?
    user == record.user
  end 
end
