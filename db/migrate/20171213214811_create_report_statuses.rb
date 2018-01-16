class CreateReportStatuses < ActiveRecord::Migration
  def change
    create_table :report_statuses do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
