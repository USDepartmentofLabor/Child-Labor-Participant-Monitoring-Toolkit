class CreateIndicators < ActiveRecord::Migration
  def change
    create_table :indicators do |t|
      t.string :code
      t.text :indicator
      t.string :indicator_type
      t.text :use
      t.text :definitions
      t.text :frequency
      t.integer :user_id
      t.references :project, index: true

      t.timestamps null: false
    end
    add_foreign_key :indicators, :projects
  end
end
