class CreateTechnicalProgressReports < ActiveRecord::Migration
  def change
    create_table :technical_progress_reports do |t|
      t.references  :reporting_period, index: true, null: false
      t.references  :reporting_status, index: true, null: false
      t.boolean     :tpr_included, default: false, null: false
      t.boolean     :annex_a_included, default: false, null: false
      t.boolean     :annex_b_included, default: false, null: false
      t.boolean     :annex_c_included, default: false, null: false
      t.boolean     :annex_d_included, default: false, null: false
      t.boolean     :annex_e_included, default: false, null: false
      t.boolean     :annex_f_included, default: false, null: false
      t.boolean     :annex_g_included, default: false, null: false
      t.boolean     :annex_h_included, default: false, null: false
      t.boolean     :annex_i_included, default: false, null: false
      t.string      :submitted_by
      t.date        :date_submitted

      t.timestamps null: false
    end
    add_foreign_key :technical_progress_reports, :reporting_periods
    add_foreign_key :technical_progress_reports, :reporting_statuses
  end
end
