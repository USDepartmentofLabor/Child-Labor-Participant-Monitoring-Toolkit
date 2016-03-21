class UpdateProjectNameAsNotNull < ActiveRecord::Migration
  def change
    change_column_null :projects, :name, false
  end
end
