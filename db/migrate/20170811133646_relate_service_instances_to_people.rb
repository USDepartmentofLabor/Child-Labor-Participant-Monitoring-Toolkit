class RelateServiceInstancesToPeople < ActiveRecord::Migration
  def change
    rename_column :service_instances, :child_id, :person_id
  end
end
