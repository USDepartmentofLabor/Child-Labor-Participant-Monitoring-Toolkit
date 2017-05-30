class Relationship < ActiveRecord::Base
  has_many :people

  validates_uniqueness_of :code
  validates_uniqueness_of :canonical_name
  validates_presence_of :display_name
end
