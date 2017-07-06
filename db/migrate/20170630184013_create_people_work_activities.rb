class CreatePeopleWorkActivities < ActiveRecord::Migration
  def change
    create_table :people_work_activities do |t|
      t.integer :person_id
      t.integer :work_activity_id
    end

    add_foreign_key :people_work_activities, :people
    add_foreign_key :people_work_activities, :work_activities
  end
end
