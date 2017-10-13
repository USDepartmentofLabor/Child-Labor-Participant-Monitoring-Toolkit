class ReportAttachment < ActiveRecord::Base
  validates_presence_of :name, :location, :version, :annex, :mime_type, :hash

  belongs_to :technical_progress_report
end
