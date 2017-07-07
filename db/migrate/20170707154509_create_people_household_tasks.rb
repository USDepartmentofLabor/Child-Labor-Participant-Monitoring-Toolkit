class CreatePeopleHouseholdTasks < ActiveRecord::Migration
  def change
    create_table :people_household_tasks do |t|
      t.integer :person_id
      t.integer :household_task_id
    end

    add_foreign_key :people_household_tasks, :people
    add_foreign_key :people_household_tasks, :household_tasks
  end
end
