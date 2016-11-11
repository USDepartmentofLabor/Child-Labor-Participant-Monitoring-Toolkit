class AddAgeToChildren < ActiveRecord::Migration
  def change
    add_column :children, :age, :integer
  end
end
