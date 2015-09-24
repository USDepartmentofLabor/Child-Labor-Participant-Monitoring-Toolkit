class ChangeReportFields < ActiveRecord::Migration
  def change
    change_column :reports, :service_type, :string, null: true
    change_column :reports, :target_type, :string, null: true
  end
end
