class CreateTargets < ActiveRecord::Migration
  def change
    create_table :targets do |t|
			t.integer :period
			t.integer :work_status_id
			t.integer :gender, limit: 2
			t.decimal :target_value
			t.references :indicator, index: true
			
      t.timestamps null: false
    end
		add_foreign_key :targets, :indicators
  end
end
