class AddReportAttachments < ActiveRecord::Migration
  def change
    create_table :report_attachments, id: false do |t|
      t.primary_key :id, :uuid, default: 'gen_random_uuid()'
      t.references :report, null: false
      t.string :attachment_file_name, null: false
      t.string :attachment_content_type, null: false
      t.string :attachment_version, null: false, length: 10
      t.string :attachment_annex, null: false, length: 1
      t.integer :attachment_file_size
      t.timestamp :attachment_updated_at
      t.timestamps null: false
    end
  end
end
