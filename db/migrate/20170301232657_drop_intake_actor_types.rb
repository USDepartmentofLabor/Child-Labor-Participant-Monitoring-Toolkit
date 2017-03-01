class DropIntakeActorTypes < ActiveRecord::Migration
  def change
    drop_table :intake_actor_types
  end
end
