class CreateIndicatorDetails < ActiveRecord::Migration
  def change
    create_table :indicator_details do |t|
      t.references :indicator, index: true
      t.references :reporting_period, index: true
      t.decimal :target
      t.decimal :actual

      t.timestamps null: false
    end
    add_foreign_key :indicator_details, :indicators
    add_foreign_key :indicator_details, :reporting_periods
  end
end
