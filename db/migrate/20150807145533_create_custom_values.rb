class CreateCustomValues < ActiveRecord::Migration
  def change
    create_table :custom_values do |t|
      t.integer :custom_field_id
      t.text :value_text

      t.timestamps null: false
    end
  end
end
