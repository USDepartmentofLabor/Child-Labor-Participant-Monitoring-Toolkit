class AddIndicatorToReports < ActiveRecord::Migration
  def change
    add_column :reports, :indicator, :string
  end
end
