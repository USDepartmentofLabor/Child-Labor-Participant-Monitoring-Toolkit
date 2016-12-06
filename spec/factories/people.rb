require 'faker'

FactoryGirl.define do
  factory :person do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    sex { [1, 2].sample }
    age { (5..17).to_a.sample }
  end

end
