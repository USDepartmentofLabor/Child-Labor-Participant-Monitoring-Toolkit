class AddColumnsToCustomFields < ActiveRecord::Migration
  def change
    add_column :custom_fields, :section_id, :integer
    add_column :custom_fields, :help_text,  :string
  end
end
