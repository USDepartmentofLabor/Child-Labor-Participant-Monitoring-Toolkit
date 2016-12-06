class AddColumnsToHouseholds < ActiveRecord::Migration
  def change
    add_column :households, :intake_form_number, :string
    add_column :households, :housing_number, :string
    add_column :households, :home_number, :string
    add_column :households, :district, :string
    add_column :households, :area, :integer, limit: 2
    add_column :households, :references_for_access, :string
  end
end
