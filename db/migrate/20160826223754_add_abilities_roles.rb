class AddAbilitiesRoles < ActiveRecord::Migration
  def change
    create_table :abilities_roles do |t|
      t.references :ability, index: true
      t.references :role, index: true
    end
    add_foreign_key :abilities_roles, :abilities
    add_foreign_key :abilities_roles, :roles
  end
end
