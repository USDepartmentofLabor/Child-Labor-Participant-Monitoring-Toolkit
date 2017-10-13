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

    unless address.nil?
      return "#{self.organization}\n#{address.to_mailing}"
    end

    return nil
  end

  def headquarters_location
    self.locations.where('location_type_id = 1').first
  end

  def field_address
    address = self.field_location

    address&.to_mailing || nil
  end

  def field_addresses
    "TODO"
  end

  def field_location
    self.locations.where('location_type_id = 2').first
  end
end
