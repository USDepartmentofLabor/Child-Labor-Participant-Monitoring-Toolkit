class WorkActivity < ActiveRecord::Base
  validates_uniqueness_of :code
  validates_uniqueness_of :canonical_name
  validates_presence_of :display_name
end
