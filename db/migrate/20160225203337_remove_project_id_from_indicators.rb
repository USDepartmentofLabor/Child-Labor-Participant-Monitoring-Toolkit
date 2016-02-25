class RemoveProjectIdFromIndicators < ActiveRecord::Migration
  def change
    remove_column :indicators, :project_id, :integer
  end
end
