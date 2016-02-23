class RemoveProjectIdFromChildStatuses < ActiveRecord::Migration
  def change
    remove_column :child_statuses, :project_id, :integer
  end
end
