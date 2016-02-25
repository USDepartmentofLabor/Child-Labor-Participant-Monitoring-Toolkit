class DropTableProjectsChildren < ActiveRecord::Migration
  def change
    drop_table :projects_children
  end
end
