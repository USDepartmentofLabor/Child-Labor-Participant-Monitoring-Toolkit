class CreateServiceInstances < ActiveRecord::Migration
  def change
    create_table :service_instances do |t|
      t.references :child, index: true
      t.references :service, index: true
      t.date :start_date
      t.date :end_date
      t.integer :hours
      t.text :notes

      t.timestamps null: false
    end
    add_foreign_key :service_instances, :children
    add_foreign_key :service_instances, :services
  end
end
