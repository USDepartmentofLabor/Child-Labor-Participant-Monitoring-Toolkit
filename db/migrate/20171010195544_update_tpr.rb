class UpdateTpr < ActiveRecord::Migration
  def change
    remove_column :technical_progress_reports, :tpr_included
    remove_column :technical_progress_reports, :annex_i_included
    add_column :technical_progress_reports, :is_final_report, :boolean, :null => false, :default => false
    add_column :technical_progress_reports, :is_semi_annual, :boolean, :null => false, :default => true
  end
end
