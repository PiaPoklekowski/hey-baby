class DocumentPolicy < ApplicationPolicy
  has_many_attached :photos
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end

    def resolve
      scope.all
    end
  end

  def show?
    true
  end
end
