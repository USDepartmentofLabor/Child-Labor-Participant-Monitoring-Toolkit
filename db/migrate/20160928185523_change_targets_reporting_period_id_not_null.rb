class ChangeTargetsReportingPeriodIdNotNull < ActiveRecord::Migration
  def change
    change_column_null :targets, :reporting_period_id, false
  end
end
