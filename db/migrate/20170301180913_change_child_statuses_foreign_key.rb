class ChangeChildStatusesForeignKey < ActiveRecord::Migration
  def change
    remove_foreign_key :child_statuses, :children
    add_foreign_key :child_statuses, :people, column: :child_id
  end
end
