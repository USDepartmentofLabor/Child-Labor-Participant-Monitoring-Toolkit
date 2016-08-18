class CreateReportingStatuses < ActiveRecord::Migration
  def change
    create_table :reporting_statuses do |t|
      t.string  :name, null: false

      t.timestamps null: false
    end
  end
end
