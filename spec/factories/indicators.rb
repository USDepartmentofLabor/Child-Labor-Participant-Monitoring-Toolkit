require 'faker'

FactoryBot.define do
  factory :indicator do
    code "Code"
    indicator "Indicator"
    indicator_type "Indicator Type"
    use "Use"
    definitions "Definitions"
    baseline 100
    unit_of_measure_id 1
    reporting_frequency_id 1

    unit_of_measure
    reporting_frequency
  end
end
