class CreateAdults < ActiveRecord::Migration
  def change
    create_table :adults do |t|
      t.string :fname
      t.string :lname
      t.string :mname
      t.integer :sex, limit: 2
      t.date :dob
      t.references :household, index: true

      t.timestamps null: false
    end
    add_foreign_key :adults, :households
  end
end
