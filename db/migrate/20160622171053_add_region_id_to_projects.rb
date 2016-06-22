class AddRegionIdToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :region
    add_foreign_key :projects, :regions
  end
end
