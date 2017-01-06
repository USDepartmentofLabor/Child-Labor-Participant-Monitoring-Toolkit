class RemoveAddressFieldsFromHousehold < ActiveRecord::Migration
  def change
    remove_column :households, :address, :string
    remove_column :households, :city, :string
    remove_column :households, :state, :string
    remove_column :households, :country, :string
    remove_column :households, :phone, :string
  end
end
