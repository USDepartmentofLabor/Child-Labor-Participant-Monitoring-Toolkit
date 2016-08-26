class CreateRolesUsers < ActiveRecord::Migration
  def change
    create_table :roles_users do |t|
      t.references :role, index: true
      t.references :user, index: true
    end
    add_foreign_key :roles_users, :roles
    add_foreign_key :roles_users, :users
  end
end
