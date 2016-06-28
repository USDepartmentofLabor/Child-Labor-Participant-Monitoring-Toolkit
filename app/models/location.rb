class Location < ActiveRecord::Base
  belongs_to :project
  belongs_to :location_type
end
