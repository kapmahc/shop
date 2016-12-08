module Shop
  class VariantPolicy < ApplicationPolicy
    def index?
      user.is_admin?
    end

    def create?
      user.is_admin?
    end

    def update?
      user.is_admin?
    end

    def destroy?
      user.is_admin?
    end
  end
end