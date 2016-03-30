class AddIntakeDateToChildrenAndHouseholds < ActiveRecord::Migration
  def change
    add_column :children, :intake_date, :date
    add_column :households, :intake_date, :date
  end
end
