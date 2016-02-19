class ChangeHouseholdsNameToNotNull < ActiveRecord::Migration
  def change

    change_column_null :households, :name, false
  end
end
