class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    record.user == user
  end

  def update?
    record.fam.user == user
  end

  def destroy?
    record.fam.user == user
  end

  def accept?
    record.fam.user == user
  end

  def decline?
    record.fam.user == user
  end
end
