class Project < ActiveRecord::Base
  validates :name, presence: true
  has_many :project_targets, :dependent => :destroy

  accepts_nested_attributes_for :project_targets

  after_create :generate_common_indicators

  def generate_common_indicators
    Indicator.create_common_indicators()
  end

end
