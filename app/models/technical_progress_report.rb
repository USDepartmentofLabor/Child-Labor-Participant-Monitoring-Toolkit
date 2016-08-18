class TechnicalProgressReport < ActiveRecord::Base
  validates :reporting_period_id, presence: true
  validates :reporting_status_id, presence: true

  belongs_to :reporting_period
  belongs_to :reporting_status

end
