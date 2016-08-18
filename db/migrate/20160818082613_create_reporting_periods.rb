class CreateReportingPeriods < ActiveRecord::Migration
  def change
    create_table :reporting_periods do |t|
      t.date    :start_date, null: false
      t.date    :end_date, null: false
      t.string  :name, null: false

      t.timestamps null: false
    end
  end
end
