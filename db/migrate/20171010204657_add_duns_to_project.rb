class AddDunsToProject < ActiveRecord::Migration
  def change
    add_column :projects, :duns_number, :string, :length => 9
  end
end
