class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.text :service_ids, array: true, default: []
      t.string :service_type, null: false
      t.text :target_ids, array: true, default: []
      t.string :target_type, null: false

      t.timestamps null: false
    end
  end
end
