class CreateAbilities < ActiveRecord::Migration
  def change
    create_table :abilities do |t|
      t.string :name
    end
    add_index :abilities, :name, unique: true
  end
end
