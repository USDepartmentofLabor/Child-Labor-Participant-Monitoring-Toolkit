class ChangeCountryColumnInHouseholds < ActiveRecord::Migration
  def change
    change_column :households, :country, :string, limit: 2
  end
end
