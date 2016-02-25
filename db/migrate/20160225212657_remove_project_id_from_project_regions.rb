class RemoveProjectIdFromProjectRegions < ActiveRecord::Migration
  def change
    remove_column :project_regions, :project_id, :integer
  end
end
