class AddServiceTypeCategoryToServiceTypes < ActiveRecord::Migration
  def change
    add_reference :service_types, :service_type_category, index: true
    add_foreign_key :service_types, :service_type_categories
  end
end
