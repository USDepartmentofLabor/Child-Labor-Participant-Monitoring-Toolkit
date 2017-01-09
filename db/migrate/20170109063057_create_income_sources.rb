class CreateIncomeSources < ActiveRecord::Migration
  def change
    create_table :income_sources do |t|
      t.string :name
      t.integer :estimated_volume_produced
      t.integer :estimated_volume_sold
      t.decimal :estimated_income
      t.references :household, index: true

      t.timestamps null: false
    end
    add_foreign_key :income_sources, :households
  end
end
