class AddAddressColumnsToHousehold < ActiveRecord::Migration
  def change
    add_column :households, :address_line_1, :string
    add_column :households, :address_line_2, :string
    add_column :households, :postal_code, :string
    add_column :households, :dependent_locality, :string
    add_column :households, :locality, :string
    add_column :households, :adminv_area, :string
    add_column :households, :dependent_adminv_area, :string
    add_column :households, :country, :string
    add_column :households, :address_info, :text
  end
end
