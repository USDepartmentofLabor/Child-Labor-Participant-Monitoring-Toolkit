class AddDefinitionToServiceTypes < ActiveRecord::Migration
  def change
    add_column :service_types, :definition, :string
  end
end
