class AddProjectToService < ActiveRecord::Migration
  def change
    add_reference :services, :project, index: true
    add_foreign_key :services, :projects
  end
end
