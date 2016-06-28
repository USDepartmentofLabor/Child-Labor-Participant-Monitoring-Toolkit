class DropRegionsColumns < ActiveRecord::Migration
  def change
    remove_column :regions, :state
    remove_column :regions, :project_id
    rename_column :regions, :country, :name
  end
end
