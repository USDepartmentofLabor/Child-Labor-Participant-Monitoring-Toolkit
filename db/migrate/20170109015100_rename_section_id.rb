class RenameSectionId < ActiveRecord::Migration
  def change
    rename_column :custom_fields, :section_id, :custom_section_id
  end
end
