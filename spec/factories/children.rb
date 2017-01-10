FactoryGirl.define do
  factory :child do
    sequence(:first_name) { |n| "FN #{n}" }
    sequence(:last_name) { |n| "LN #{n}" }
    middle_name "Middle Name"
    sex { [1,2].sample }
    dob "2015-06-10"
  end
end
