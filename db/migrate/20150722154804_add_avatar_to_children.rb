class AddAvatarToChildren < ActiveRecord::Migration
  def change
    add_column :children, :avatar, :string
  end
end
