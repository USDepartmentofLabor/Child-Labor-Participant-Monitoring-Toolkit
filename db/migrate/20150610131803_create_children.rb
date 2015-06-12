class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :fname
      t.string :lname
      t.string :mname
      t.integer :sex, limit: 2
      t.date :dob
      t.string :address
      t.string :city
      t.string :state
      t.string :country, limit: 2

      t.timestamps null: false
    end
  end
end
