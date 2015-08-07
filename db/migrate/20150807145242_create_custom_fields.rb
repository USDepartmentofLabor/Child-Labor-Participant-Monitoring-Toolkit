class CreateCustomFields < ActiveRecord::Migration
  def change
    create_table :custom_fields do |t|
      t.string :name
      t.string :field_type
      t.text :selections
      t.text :validation_rules
      t.integer :project_id
      t.string :model_type
      t.string :string

      t.timestamps null: false
    end
  end
end
