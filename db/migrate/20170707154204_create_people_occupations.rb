class CreatePeopleOccupations < ActiveRecord::Migration
  def change
    create_table :people_occupations do |t|
      t.integer :person_id
      t.integer :occupation_id
    end

    add_foreign_key :people_occupations, :people
    add_foreign_key :people_occupations, :occupations
  end
end
