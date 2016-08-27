require 'faker'

FactoryGirl.define do
  factory :indicator do
    code "IND 1.1"
    indicator "TI : Number of items we are counting "
    indicator_type "Custom"
    use { Faker::Lorem.paragraph }
    definitions { Faker::Lorem.paragraph }
    baseline { Faker::Number.decimal(4) }
    unit_of_measure_id 1

    unit_of_measure
  end
end
