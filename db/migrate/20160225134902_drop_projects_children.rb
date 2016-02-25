class DropProjectsChildren < ActiveRecord::Migration
  def change
    drop_table :projects_children
    reversible do |direction|
      direction.down { puts "Can't restore the table" }
    end
  end
end
