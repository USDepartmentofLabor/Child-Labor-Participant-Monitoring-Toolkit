class ReportComment < ActiveRecord::Base
  belongs_to :technical_progress_report
  belongs_to :report_attachment
  belongs_to :user
end
