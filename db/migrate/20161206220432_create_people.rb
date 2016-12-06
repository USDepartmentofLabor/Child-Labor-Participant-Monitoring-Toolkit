class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|

      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.integer :sex, limit: 2
      t.date :dob
      t.integer :age
      t.integer :household_id
      t.date :intake_date
      t.boolean :is_head_of_household

      t.timestamps null: false
    end

    add_foreign_key :people, :households
  end
end
