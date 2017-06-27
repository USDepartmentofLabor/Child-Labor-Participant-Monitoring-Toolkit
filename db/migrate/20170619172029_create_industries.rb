class CreateIndustries < ActiveRecord::Migration
  def change
    create_table :industries do |t|
      t.string :code, null: false, required: true, unique: true
      t.string :canonical_name, null: false, required: true, unique: true
      t.string :display_name, null: false, required: true

      t.timestamps null: false
    end
  end
end
