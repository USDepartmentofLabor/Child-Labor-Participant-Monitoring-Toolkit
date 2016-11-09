class RemoveFrequencyFromIndicators < ActiveRecord::Migration
  def change
    remove_column :indicators, :frequency
  end
end
