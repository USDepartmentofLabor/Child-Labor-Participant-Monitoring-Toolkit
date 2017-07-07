class RemoveDidWorkFromPeople < ActiveRecord::Migration
  def change
    remove_column :people, :did_work
  end
end
