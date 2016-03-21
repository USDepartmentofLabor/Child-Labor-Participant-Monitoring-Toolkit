class CreateProjectTargetTypes < ActiveRecord::Migration
  def change
    create_table :project_target_types do |t|
      t.string :name, full: false

      t.timestamps null: false
    end
  end
end
