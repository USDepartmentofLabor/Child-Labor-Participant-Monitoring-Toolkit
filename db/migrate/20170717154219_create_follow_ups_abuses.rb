class CreateFollowUpsAbuses < ActiveRecord::Migration
  def change
    create_table :follow_ups_abuses do |t|
      t.integer :follow_up_id
      t.integer :abuse_id
    end

    add_foreign_key :follow_ups_abuses, :follow_ups
    add_foreign_key :follow_ups_abuses, :abuses
  end
end
