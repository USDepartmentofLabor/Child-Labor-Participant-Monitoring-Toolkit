class Abuse < ActiveRecord::Base
  has_and_belongs_to_many :people, :join_table => :people_abuses
  has_and_belongs_to_many :follow_ups, :join_table => :follow_ups_abuses

  validates_presence_of :code
  validates_uniqueness_of :code
  validates_uniqueness_of :canonical_name
  validates_presence_of :canonical_name
  validates_presence_of :display_name
end
