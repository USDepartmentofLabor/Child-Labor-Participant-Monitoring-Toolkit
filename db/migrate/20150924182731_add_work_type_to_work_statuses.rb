class AddWorkTypeToWorkStatuses < ActiveRecord::Migration
  def change
    add_column :work_statuses, :work_type, :string
  end
end
