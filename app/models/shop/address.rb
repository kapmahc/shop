module Shop
  class Address < ApplicationRecord
    validates :full_name, :content, :phone, :zip_code, :country_code, presence: true
    belongs_to :user

    def country_name
      country = ISO3166::Country[country_code]
      country.translations[I18n.locale.to_s] || country.name
    end
  end
end
