class RecipePolicy < ApplicationPolicy
  def new?
    user_logged_in?
  end

  def create?
    new?
  end

  def edit?
    user_logged_in?
  end

  def update?
    edit?
  end

  def destroy?
    user_logged_in?
  end
end
