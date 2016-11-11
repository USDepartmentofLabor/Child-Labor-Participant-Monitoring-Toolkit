class AddSortOrderToCustomTypes < ActiveRecord::Migration
  def change
    add_column :custom_fields, :sort_order, :integer
  end
end
