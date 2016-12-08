module Shop
  class PropertyField < ApplicationRecord
    validates :name, :flag, :lang, presence: true

  end
end
