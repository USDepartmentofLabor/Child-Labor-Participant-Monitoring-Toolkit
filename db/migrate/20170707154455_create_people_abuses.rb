class CreatePeopleAbuses < ActiveRecord::Migration
  def change
    create_table :people_abuses do |t|
      t.integer :person_id
      t.integer :abuse_id
    end

    add_foreign_key :people_abuses, :people
    add_foreign_key :people_abuses, :abuses, column: :abuse_id
  end
end
