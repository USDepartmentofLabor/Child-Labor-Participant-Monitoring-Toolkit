class AddTotalTargetChildrenToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :total_target_children, :integer
  end
end
