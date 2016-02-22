class RemoveProjectIdFromCustomFields < ActiveRecord::Migration
  def change
    remove_column :custom_fields, :project_id, :integer
  end
end
