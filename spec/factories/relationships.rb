require 'faker'

FactoryBot.define do
  factory :relationship do
    sequence(:code) {|n| "C#{n}"}
    display_name Faker::Lorem.word
    canonical_name Faker::Lorem.word
  end
end
