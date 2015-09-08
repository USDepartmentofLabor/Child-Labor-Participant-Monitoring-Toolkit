class CreateProjectRegions < ActiveRecord::Migration
  def change
    create_table :project_regions do |t|
      t.string :country
      t.string :state
      t.references :project, index: true

      t.timestamps null: false
    end
    add_foreign_key :project_regions, :projects
  end
end
