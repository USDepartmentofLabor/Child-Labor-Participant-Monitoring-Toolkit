class Household < ActiveRecord::Base
  validates :name, presence: true

  has_many :adults, dependent: :destroy
  has_many :children
  has_many :people
  has_many :intake_actors

  accepts_nested_attributes_for :adults, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :children, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :people, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :intake_actors, allow_destroy: true, reject_if: :all_blank
end
