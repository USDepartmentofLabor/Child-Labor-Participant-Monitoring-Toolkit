class CreateProjectsChildren < ActiveRecord::Migration
  def change
    create_table :projects_children do |t|
      t.references :project, index: true
      t.references :child, index: true

      t.timestamps null: false
    end
  end
end
