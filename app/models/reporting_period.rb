class ReportingPeriod < ActiveRecord::Base
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :name, presence: true
  
end
