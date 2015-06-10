class CreateChildStatuses < ActiveRecord::Migration
  def change
    create_table :child_statuses do |t|
      t.date :start_date
      t.date :end_date
      t.integer :work_status_id
      t.integer :education_status_id
      t.text :note
      t.references :child, index: true

      t.timestamps null: false
    end
    add_foreign_key :child_statuses, :children
  end
end
