class AddBaselineToIndicators < ActiveRecord::Migration
  def change
		add_column :indicators, :baseline, :decimal, precision: 15, scale: 4
  end
end
