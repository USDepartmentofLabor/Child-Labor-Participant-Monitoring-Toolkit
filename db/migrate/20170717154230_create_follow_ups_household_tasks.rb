class CreateFollowUpsHouseholdTasks < ActiveRecord::Migration
  def change
    create_table :follow_ups_household_tasks do |t|
      t.integer :follow_up_id
      t.integer :household_task_id
    end

    add_foreign_key :follow_ups_household_tasks, :follow_ups
    add_foreign_key :follow_ups_household_tasks, :household_tasks
  end
end
