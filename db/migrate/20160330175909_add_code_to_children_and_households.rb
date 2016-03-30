class AddCodeToChildrenAndHouseholds < ActiveRecord::Migration
  def change
    add_column :children, :code, :string
    add_column :households, :code, :string

    add_index :children, :code, :unique => true
    add_index :households, :code, :unique => true
  end
end
