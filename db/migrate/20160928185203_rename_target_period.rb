class RenameTargetPeriod < ActiveRecord::Migration
  def change
    rename_column :targets, :period, :reporting_period_id
  end
end
