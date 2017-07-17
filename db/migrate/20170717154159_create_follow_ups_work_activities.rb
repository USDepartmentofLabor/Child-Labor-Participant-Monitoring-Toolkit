class CreateFollowUpsWorkActivities < ActiveRecord::Migration
  def change
    create_table :follow_ups_work_activities do |t|
      t.integer :follow_up_id
      t.integer :work_activity_id
    end

    add_foreign_key :follow_ups_work_activities, :follow_ups
    add_foreign_key :follow_ups_work_activities, :work_activities
  end
end
