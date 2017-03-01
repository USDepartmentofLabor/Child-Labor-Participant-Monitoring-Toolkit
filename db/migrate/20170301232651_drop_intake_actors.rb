class DropIntakeActors < ActiveRecord::Migration
  def change
    drop_table :intake_actors
  end
end
