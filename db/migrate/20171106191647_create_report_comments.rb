class CreateReportComments < ActiveRecord::Migration
  def change
    create_table :report_comments do |t|
      t.references :technical_progress_report, index: true
      t.references :report_attachment, index: true
      t.references :user, index: true
      t.text :body, null: false
      t.string :category, limit: 20, null: false
      t.timestamps null: false
    end
    add_foreign_key :report_comments, :technical_progress_reports
    add_foreign_key :report_comments, :report_attachments
    add_foreign_key :report_comments, :users
  end
end
