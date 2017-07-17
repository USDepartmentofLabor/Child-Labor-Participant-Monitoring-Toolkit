class CreateFollowUpsOccupations < ActiveRecord::Migration
  def change
    create_table :follow_ups_occupations do |t|
      t.integer :follow_up_id
      t.integer :occupation_id
    end

    add_foreign_key :follow_ups_occupations, :follow_ups
    add_foreign_key :follow_ups_occupations, :occupations
  end
end
