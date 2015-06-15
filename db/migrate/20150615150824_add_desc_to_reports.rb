class AddDescToReports < ActiveRecord::Migration
  def change
    add_column :reports, :desc, :text
  end
end
