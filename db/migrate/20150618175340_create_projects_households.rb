class CreateProjectsHouseholds < ActiveRecord::Migration
  def change
    create_table :projects_households do |t|
      t.references :project, index: true
      t.references :household, index: true

      t.timestamps null: false
    end
    add_foreign_key :projects_households, :projects
    add_foreign_key :projects_households, :households
  end
end
