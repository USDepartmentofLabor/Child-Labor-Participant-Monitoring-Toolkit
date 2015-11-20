class AddProjectToServiceInstance < ActiveRecord::Migration
  def change
    add_reference :service_instances, :project, index: true
    add_foreign_key :service_instances, :projects
  end
end
