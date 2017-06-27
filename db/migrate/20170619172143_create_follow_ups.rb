class CreateFollowUps < ActiveRecord::Migration
  def change
    create_table :follow_ups do |t|
      t.integer :person_id, :null => false
      t.integer :work_status_id
      t.integer :education_status_id
      t.date    :follow_date, :null => false
      t.boolean :did_work
      t.boolean :have_job_returning_to
      t.integer :hours_worked
      t.integer :occupation_id
      t.integer :industry_id
      t.boolean :exposed_to_hazardous_condition
      t.boolean :subject_to_abuses
      t.boolean :performed_housework
      t.integer :hours_worked_on_housework
      t.boolean :enrolled_in_school

      t.timestamps null: false
    end

    add_foreign_key :follow_ups, :people
    add_foreign_key :follow_ups, :work_statuses
    add_foreign_key :follow_ups, :education_statuses
    add_foreign_key :follow_ups, :occupations
    add_foreign_key :follow_ups, :industries

  end
end
