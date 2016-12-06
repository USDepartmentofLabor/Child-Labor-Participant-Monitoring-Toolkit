class CreateIntakeActors < ActiveRecord::Migration
  def change
    create_table :intake_actors do |t|

      t.integer   :household_id, :null => false
      t.integer   :intake_actor_type_id, :null => false
      t.date      :action_date
      t.string    :first_name
      t.string    :last_name

      t.timestamps null: false
    end

    add_foreign_key :intake_actors, :households
    add_foreign_key :intake_actors, :intake_actor_types
  end
end
