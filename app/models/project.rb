class Project < ActiveRecord::Base
  has_many :project_targets, :dependent => :destroy
  has_many :locations, :dependent => :destroy
  belongs_to :region

  validates_presence_of :title, :name, :region_id

  accepts_nested_attributes_for :project_targets, :locations

  after_create :generate_common_indicators

  def generate_common_indicators
    Indicator.create_common_indicators()
  end

  def headquarters_address
    address = self.headquarters_location

    city_state_zip = [
      address.city,
      address.state,
      address.zip
    ].join(', ')

    [self.organization,
     address.address_line1,
     address.address_line2,
     city_state_zip,
     address.country].join("\n")
  end

  def headquarters_location
    self.locations.where('location_type_id = 1').first
  end

  def field_addresses
    "TODO"
  end
end
