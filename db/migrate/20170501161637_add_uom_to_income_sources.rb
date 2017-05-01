class AddUomToIncomeSources < ActiveRecord::Migration
  def change
    add_column :income_sources, :unit_of_measure, :text
  end
end
