class Indicator < ActiveRecord::Base
  belongs_to :unit_of_measure
  belongs_to :reporting_frequency, class_name: 'Frequency'
  has_many :indicator_details

  validates :code, presence: true
  validates :indicator, presence: true
  validates :unit_of_measure_id, presence: true

  def indicator_detail_rows
    reporting_periods = ReportingPeriod.all
    indicator_detail_rows = []
    reporting_periods.zip(indicator_details).each do |rp, id|
      if id.nil?
        indicator_detail_rows.push IndicatorDetail.new(indicator_id: id,
reporting_period_id: rp.id)
      else
        indicator_detail_rows.push id
      end
    end
    indicator_detail_rows
  end

  def self.create_common_indicators()
    DBMS::DefaultData::Indicators.create()
  end
end
