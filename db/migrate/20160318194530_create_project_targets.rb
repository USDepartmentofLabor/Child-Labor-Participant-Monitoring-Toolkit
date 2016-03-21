class CreateProjectTargets < ActiveRecord::Migration
  def change
    create_table :project_targets do |t|

      t.references  :project, index: true
      t.references  :project_target_type, index: true
      t.decimal     :target

      t.timestamps null: false
    end
    add_foreign_key :project_targets, :projects
    add_foreign_key :project_targets, :project_target_types
  end
end
