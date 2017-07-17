class WorkActivity < ActiveRecord::Base
  validates_presence_of :code
  validates_uniqueness_of :code
  validates_uniqueness_of :canonical_name
  validates_presence_of :canonical_name
  validates_presence_of :display_name

  has_and_belongs_to_many :people
  has_and_belongs_to_many :follow_ups
end
