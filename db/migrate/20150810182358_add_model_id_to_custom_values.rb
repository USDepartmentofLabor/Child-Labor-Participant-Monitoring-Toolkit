class AddModelIdToCustomValues < ActiveRecord::Migration
  def change
    add_column :custom_values, :model_id, :integer
  end
end
