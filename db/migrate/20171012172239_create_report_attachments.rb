class CreateReportAttachments < ActiveRecord::Migration
  def change
    create_table :report_attachments do |t|
      t.references :technical_progress_report, index: true, null: false
      t.string :attachment_file_name, null: false
      t.string :attachment_content_type, null: false
      t.string :attachment_fingerprint, null: false
      t.string :attachment_version, limit: 10, null: false
      t.string :attachment_annex, limit: 1, null: false

      t.timestamps null: false
    end
    add_foreign_key :report_attachments, :technical_progress_reports
  end
end
