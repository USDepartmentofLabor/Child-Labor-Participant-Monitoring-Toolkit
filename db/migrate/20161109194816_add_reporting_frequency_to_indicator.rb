class AddReportingFrequencyToIndicator < ActiveRecord::Migration
  def change
    add_reference :indicators, :reporting_frequency, index: true
    add_foreign_key :indicators, :frequencies, column: :reporting_frequency_id
  end
end
