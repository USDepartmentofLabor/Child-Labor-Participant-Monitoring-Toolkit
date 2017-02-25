class ReportingPeriod < ActiveRecord::Base
  has_many :indicator_details
  
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :name, presence: true
end
