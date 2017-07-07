class CreatePeopleHazardousConditions < ActiveRecord::Migration
  def change
    create_table :people_hazardous_conditions do |t|
      t.integer :person_id
      t.integer :hazardous_condition_id
    end

    add_foreign_key :people_hazardous_conditions, :people
    add_foreign_key :people_hazardous_conditions, :hazardous_conditions
  end
end
