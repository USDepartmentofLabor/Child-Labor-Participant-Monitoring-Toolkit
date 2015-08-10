class RemoveStringField < ActiveRecord::Migration
  def change
    remove_column :custom_fields, :string
  end
end
