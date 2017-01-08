class Household < ActiveRecord::Base
  validates :name, presence: true

  has_many :people

  accepts_nested_attributes_for :people, allow_destroy: true, reject_if: :all_blank

  def children
    self.people.who_are_children
  end

  def adults
    self.people.who_are_adults
  end
end
