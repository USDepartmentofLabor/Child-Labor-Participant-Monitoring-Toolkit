class CreatePeopleIndustries < ActiveRecord::Migration
  def change
    create_table :people_industries do |t|
      t.integer :person_id
      t.integer :industry_id
    end

    add_foreign_key :people_industries, :people
    add_foreign_key :people_industries, :industries
  end
end
