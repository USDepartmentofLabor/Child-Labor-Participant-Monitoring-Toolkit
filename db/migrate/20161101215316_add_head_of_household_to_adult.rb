class AddHeadOfHouseholdToAdult < ActiveRecord::Migration
  def change
    add_column :adults, :is_head_of_household, :boolean
  end
end
