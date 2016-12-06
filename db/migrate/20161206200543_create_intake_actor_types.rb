class CreateIntakeActorTypes < ActiveRecord::Migration
  def change
    create_table :intake_actor_types do |t|
      t.string :name, :null => false, :default => 'NOT SET'
    end
  end
end
