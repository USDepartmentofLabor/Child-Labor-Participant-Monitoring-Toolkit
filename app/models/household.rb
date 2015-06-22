class Household < ActiveRecord::Base
  validates :country, length: {maximum: 2}

  has_many :projects_households, dependent: :destroy
  has_many :projects, through: :projects_households

  has_many :adults
  has_many :children

  accepts_nested_attributes_for :adults, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :children, allow_destroy: true, reject_if: :all_blank
end
