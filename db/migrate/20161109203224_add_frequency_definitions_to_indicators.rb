class AddFrequencyDefinitionsToIndicators < ActiveRecord::Migration
  def change
    add_column :indicators, :frequency_definitions, :string
  end
end
