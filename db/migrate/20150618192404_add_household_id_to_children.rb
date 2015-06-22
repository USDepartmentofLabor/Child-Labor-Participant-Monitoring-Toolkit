class AddHouseholdIdToChildren < ActiveRecord::Migration
  def change
    add_column :children, :household_id, :integer
  end
end
