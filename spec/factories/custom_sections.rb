FactoryBot.define do
  factory :custom_section do
    sequence(:title) { |n| "Title #{n}" }
  end
end

