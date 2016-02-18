class DropProjectUsers < ActiveRecord::Migration
  def change
    drop_table :project_users
  end
end
