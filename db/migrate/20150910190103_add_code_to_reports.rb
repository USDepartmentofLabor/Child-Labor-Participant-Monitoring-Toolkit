class AddCodeToReports < ActiveRecord::Migration
  def change
    add_column :reports, :code, :string
  end
end
