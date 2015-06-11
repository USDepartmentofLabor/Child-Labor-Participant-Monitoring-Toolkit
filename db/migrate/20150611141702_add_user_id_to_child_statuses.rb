class AddUserIdToChildStatuses < ActiveRecord::Migration
  def change
    add_column :child_statuses, :user_id, :integer
  end
end
