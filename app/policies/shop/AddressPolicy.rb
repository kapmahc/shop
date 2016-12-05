module Shop
  class AddressPolicy < ApplicationPolicy
    def index?
      !user.nil?
    end

    def create?
      !user.nil?
    end

    def update?
      !user.nil? && (record.user_id == user.id)
    end

    def destroy?
      !user.nil? && (record.user_id == user.id)
    end
  end
end