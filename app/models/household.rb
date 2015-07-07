class Household < ActiveRecord::Base
  validates :country, length: {maximum: 2}

  has_many :projects_households, dependent: :destroy
  has_many :projects, through: :projects_households

  has_many :adults, dependent: :destroy
  has_many :children

  accepts_nested_attributes_for :adults, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :children, allow_destroy: true, reject_if: :all_blank

  def country_name
    return nil if country.nil?
    country_iso = ISO3166::Country[country]
    country_iso.translations[I18n.locale.to_s] || country_iso.name
  end
end
