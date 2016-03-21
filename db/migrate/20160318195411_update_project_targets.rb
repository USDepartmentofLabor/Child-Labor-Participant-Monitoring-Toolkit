class UpdateProjectTargets < ActiveRecord::Migration
  def change
    change_column_null :project_targets, :project_id, false
    change_column_null :project_targets, :project_target_type_id, false
  end
end
