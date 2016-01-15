class AddUnitOfMeasureRefToIndicators < ActiveRecord::Migration
  def change
    add_reference :indicators, :unit_of_measure, index: true
    add_foreign_key :indicators, :unit_of_measures
  end
end
