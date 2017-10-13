class CreateReportAttachments < ActiveRecord::Migration
  def change
    create_table :report_attachments do |t|
      t.references :technical_progress_report, index: true, null: false
      t.string :name, limit: 255, null: false
      t.string :location, null: false
      t.string :version, limit: 10, null: false
      t.string :annex, limit: 1, null: false
      t.string :mime_type, limit: 80, null: false
      t.string :hash, limit: 140, null: false

      t.timestamps null: false
    end
    add_foreign_key :report_attachments, :technical_progress_reports
  end
end
