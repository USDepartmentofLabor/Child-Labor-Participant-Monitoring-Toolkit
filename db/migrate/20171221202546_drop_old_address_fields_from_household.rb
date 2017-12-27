class DropOldAddressFieldsFromHousehold < ActiveRecord::Migration
  def change
    remove_column :households, :intake_form_number
    remove_column :households, :housing_number
    remove_column :households, :home_number
    remove_column :households, :district
    remove_column :households, :area
    remove_column :households, :references_for_access
  end
end
