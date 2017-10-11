class TechnicalProgressReport < ActiveRecord::Base
  validates :reporting_period_id, presence: true
  validates :reporting_status_id, presence: true
  validates_inclusion_of :is_final_report, :in => [true, false]

  belongs_to :reporting_period
  belongs_to :reporting_status
end
