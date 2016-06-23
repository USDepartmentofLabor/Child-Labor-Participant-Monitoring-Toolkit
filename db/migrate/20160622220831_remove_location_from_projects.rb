class RemoveLocationFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :office_address
  end
end
