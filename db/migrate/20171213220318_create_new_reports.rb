class CreateNewReports < ActiveRecord::Migration
  def change
    drop_table :reports do |t|
    end

    create_table :reports, id: false do |t|
      t.primary_key :id, :uuid, default: 'gen_random_uuid()'
      t.references :reporting_period, index: true, foreign_key: true
      t.references :report_status, index: true, foreign_key: true
      t.integer :submitted_by
      t.date :submitted_on
      t.boolean :is_final_report, default: false
      t.string :report_frequency
      t.string :annexes_required, array: true, default: []
    end

    add_foreign_key :reports, :users, column: :submitted_by
  end
end
