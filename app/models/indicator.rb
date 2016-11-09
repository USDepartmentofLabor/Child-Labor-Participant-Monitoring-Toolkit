class Indicator < ActiveRecord::Base
  belongs_to :unit_of_measure
  belongs_to :reporting_frequency, class_name: 'Frequency'
  has_many :targets

  validates :code, presence: true
  validates :indicator, presence: true
  validates :unit_of_measure_id, presence: true

  def self.create_common_indicators()
    DBMS::DefaultData::Indicators.create()
  end
end
