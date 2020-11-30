class ScorePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    return true
  end

  def create?
    return true
  end

  def new?
    return true
  end

   def show?
    return true
  end

  def destroy?
    is_user_score?
  end

  private

  def is_user_score?
    user == record.user
  end
end
