class CreateProjectUsers < ActiveRecord::Migration
  def change
    create_table :project_users do |t|
      t.references :project, index: true
      t.references :user, index: true
      t.integer :role_ids, array: true, default: []

      t.timestamps null: false
    end
    add_foreign_key :project_users, :projects
    add_foreign_key :project_users, :users
  end
end
