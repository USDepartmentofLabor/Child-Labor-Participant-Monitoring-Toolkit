class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.references :project, index: true
      t.references :location_type, index: true
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :state
      t.string :zip
      t.string :country

      t.timestamps null: false
    end
    add_foreign_key :locations, :projects
    add_foreign_key :locations, :location_types
  end
end
