class Indicator < ActiveRecord::Base
  has_one :unit_of_measure

  validates :code, presence: true
  validates :indicator, presence: true
  validates :unit_of_measure_id, presence: true

  def self.create_common_indicators()
    DBMS::DefaultData::Indicators.create()
  end
end
