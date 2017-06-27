class AddStdColumnsToPeople < ActiveRecord::Migration
  def change
    add_column :people, :did_work, :boolean
    add_column :people, :have_job_returning_to, :boolean
    add_column :people, :hours_worked, :integer
    add_column :people, :occupation_id, :integer
    add_column :people, :industry_id, :integer
    add_column :people, :exposed_to_hazardous_condition, :boolean
    add_column :people, :subject_to_abuses, :boolean
    add_column :people, :performed_housework, :boolean
    add_column :people, :hours_worked_on_housework, :integer
    add_column :people, :enrolled_in_school, :boolean

    add_foreign_key :people, :occupations
    add_foreign_key :people, :industries
  end
end
