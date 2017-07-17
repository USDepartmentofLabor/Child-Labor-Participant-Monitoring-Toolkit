class CreateFollowUpsHazardousConditions < ActiveRecord::Migration
  def change
    create_table :follow_ups_hazardous_conditions do |t|
      t.integer :follow_up_id
      t.integer :hazardous_condition_id
    end

    add_foreign_key :follow_ups_hazardous_conditions, :follow_ups
    add_foreign_key :follow_ups_hazardous_conditions, :hazardous_conditions
  end
end
