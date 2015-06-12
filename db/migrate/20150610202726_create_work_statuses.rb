class CreateWorkStatuses < ActiveRecord::Migration
  def change
    create_table :work_statuses do |t|
      t.string :name
    end
  end
end
