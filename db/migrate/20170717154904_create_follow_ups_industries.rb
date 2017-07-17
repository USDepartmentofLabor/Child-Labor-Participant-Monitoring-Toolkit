class CreateFollowUpsIndustries < ActiveRecord::Migration
  def change
    create_table :follow_ups_industries do |t|
      t.integer :follow_up_id
      t.integer :industry_id
    end

    add_foreign_key :follow_ups_industries, :follow_ups
    add_foreign_key :follow_ups_industries, :industries
  end
end
