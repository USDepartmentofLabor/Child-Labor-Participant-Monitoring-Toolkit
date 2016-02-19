class DropProjectsHouseholds < ActiveRecord::Migration
  def change
		drop_table :projects_households
  end
end
