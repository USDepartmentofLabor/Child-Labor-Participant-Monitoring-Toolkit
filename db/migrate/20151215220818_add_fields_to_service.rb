class AddFieldsToService < ActiveRecord::Migration
  def change
    add_reference :services, :service_type, index: true
    add_foreign_key :services, :service_types
    add_column :services, :start_date, :date
    add_column :services, :end_date, :date
    add_column :services, :description, :text
  end
end
