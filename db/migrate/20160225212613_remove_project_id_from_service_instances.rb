class RemoveProjectIdFromServiceInstances < ActiveRecord::Migration
  def change
    remove_column :service_instances, :project_id, :integer
  end
end
