class AddIndicatorTypeToReports < ActiveRecord::Migration
  def change
    add_column :reports, :indicator_type, :string
  end
end
