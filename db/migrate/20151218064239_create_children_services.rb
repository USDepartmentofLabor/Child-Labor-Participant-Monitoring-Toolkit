class CreateChildrenServices < ActiveRecord::Migration
  def change
    create_table :children_services do |t|
      t.integer :child_id, index: true
      t.integer :service_id, index: true

      t.timestamps null: false
    end
    add_foreign_key :children_services, :children
    add_foreign_key :children_services, :services
  end
end
