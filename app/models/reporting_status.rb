class ReportingStatus < ActiveRecord::Base
  validates :name, presence: true

  has_many :technical_progress_reports, :dependent => :destroy
end
