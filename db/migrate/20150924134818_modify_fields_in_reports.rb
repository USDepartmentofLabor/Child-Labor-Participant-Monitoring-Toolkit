class ModifyFieldsInReports < ActiveRecord::Migration
  def change
    remove_column :reports, :code
    remove_column :reports, :indicator
    remove_column :reports, :indicator_type

    add_column :reports, :indicator_id, :integer
  end
end
