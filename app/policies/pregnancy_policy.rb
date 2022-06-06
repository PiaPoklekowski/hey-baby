class PregnancyPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def new?
    # if @record.user.role == "mother"
    #   true
    # else
    #   false
    # end
    true
  end

  def create?
    true
  end

  # def edit?
  #   true
  # end

  def update?
    true
  end
end
