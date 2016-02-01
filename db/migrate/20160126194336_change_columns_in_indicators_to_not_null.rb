class ChangeColumnsInIndicatorsToNotNull < ActiveRecord::Migration
  def change
		
		indicators = Indicator.where("code in (?)", ["E1", "L1"])
		indicators.update_all "unit_of_measure_id = 1"
		
		indicators = Indicator.where("code not in (?)", ["E1", "L1"])
		indicators.update_all "unit_of_measure_id = 2"
		
		change_column_null :indicators, :unit_of_measure_id, false
		change_column_null :indicators, :code, false
		change_column_null :indicators, :indicator, false
		change_column_null :indicators, :project_id, false
		
  end
end
