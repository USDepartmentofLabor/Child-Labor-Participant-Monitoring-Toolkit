class Location < ActiveRecord::Base
  belongs_to :project
  belongs_to :location_type

  validates_presence_of :location_type_id, :name
end
