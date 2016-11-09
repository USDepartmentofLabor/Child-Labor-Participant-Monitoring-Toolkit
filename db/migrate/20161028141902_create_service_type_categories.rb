class CreateServiceTypeCategories < ActiveRecord::Migration
  def change
    create_table :service_type_categories do |t|
      t.string :name, :null => false, :default => 'NOT SET'
      t.string :definition
    end
  end
end
