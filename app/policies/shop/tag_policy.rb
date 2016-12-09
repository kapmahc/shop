module Shop
  class TagPolicy < ApplicationPolicy
    def index?
      !user.nil? && user.is_admin?
    end

    def create?
      !user.nil? && user.is_admin?
    end

    def update?
      !user.nil? && user.is_admin?
    end

    def destroy?
      !user.nil? && user.is_admin?
    end
  end
end