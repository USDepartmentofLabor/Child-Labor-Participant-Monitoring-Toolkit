class RenameProjectRegions < ActiveRecord::Migration
  def change
    rename_table :project_regions, :regions
  end
end
