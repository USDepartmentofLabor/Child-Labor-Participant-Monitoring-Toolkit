class RemoveProjectIdFromReports < ActiveRecord::Migration
  def change
    remove_column :reports, :project_id, :integer
  end
end
