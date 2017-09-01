class CreateE1Facts < ActiveRecord::Migration
  def change
    create_table :e1_facts do |t|
      t.integer :reporting_period_id, :null => false
      t.integer :person_id, :null => false
      t.integer :work_status
      t.integer :education_status
      t.boolean :received_education_service
      t.boolean :received_livelihood_service

      t.timestamps null: false
    end

    add_foreign_key :e1_facts, :reporting_periods
    add_foreign_key :e1_facts, :people
  end
end
