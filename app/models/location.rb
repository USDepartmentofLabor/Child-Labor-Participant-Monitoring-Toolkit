class Location < ActiveRecord::Base
  belongs_to :project
  belongs_to :location_type

  validates_presence_of :location_type_id, :name

  default_scope { order(:id) }

  def to_mailing
    city_state_zip = [
      self.city,
      self.state,
      self.zip
    ].join(', ')

    [self.address_line1,
     self.address_line2,
     city_state_zip,
     self.country].join("\n")
  end
end
