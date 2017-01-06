class CreateCustomSections < ActiveRecord::Migration
  def change
    create_table :custom_sections do |t|
      t.string :title
      t.string :model_type
      t.integer :sort_order

      t.timestamps null: false
    end
  end
end
