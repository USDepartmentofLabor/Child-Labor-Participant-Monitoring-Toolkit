class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.string :code, null: false, required: true, unique: true
      t.string :canonical_name, null: false, required: true, unique: true
      t.string :display_name, null: false, required: true

      t.timestamps null: false
    end

    add_reference :people, :relationship, index: true
    add_column :people, :relationship_other, :string

    add_foreign_key :people, :relationships
  end
end
