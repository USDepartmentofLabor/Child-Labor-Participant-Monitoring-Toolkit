class HouseholdTask < ActiveRecord::Base
  has_and_belongs_to_many :people, :join_table => :people_household_tasks
  validates_presence_of :code
  validates_uniqueness_of :code
  validates_uniqueness_of :canonical_name
  validates_presence_of :canonical_name
  validates_presence_of :display_name
end
