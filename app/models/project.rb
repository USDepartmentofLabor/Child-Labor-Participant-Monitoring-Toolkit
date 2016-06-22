class Project < ActiveRecord::Base
  has_many :project_targets, :dependent => :destroy
  belongs_to :region

  validates_presence_of :title, :name, :region_id

  accepts_nested_attributes_for :project_targets

  after_create :generate_common_indicators

  def generate_common_indicators
    Indicator.create_common_indicators()
  end

end
