class DropOutdatedTables < ActiveRecord::Migration
  def change
    drop_table :report_comments
    drop_table :report_attachments
    drop_table :technical_progress_reports
    drop_table :reporting_statuses
  end
end
