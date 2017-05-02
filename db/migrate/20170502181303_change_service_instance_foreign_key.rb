class ChangeServiceInstanceForeignKey < ActiveRecord::Migration
  def change
    remove_foreign_key :service_instances, :children
    add_foreign_key :service_instances, :people, :column => :child_id,
      :primary_key => :id
  end
end
