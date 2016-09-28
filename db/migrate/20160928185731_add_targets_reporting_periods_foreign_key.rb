class AddTargetsReportingPeriodsForeignKey < ActiveRecord::Migration
  def change
    add_foreign_key :targets, :reporting_periods
  end
end
