class AddProjectIdToChildStatuses < ActiveRecord::Migration
  def change
    add_column :child_statuses, :project_id, :integer
  end
end
