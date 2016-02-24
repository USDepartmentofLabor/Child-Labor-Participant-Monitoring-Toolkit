class RemoveProjectIdFromServices < ActiveRecord::Migration
  def change
    remove_column :services, :project_id, :integer
  end
end
