FactoryGirl.define do
  factory :child do
    sequence(:fname) { |n| "FN #{n}" }
    sequence(:lname) { |n| "LN #{n}" }
    mname "Middle Name"
    sex { [1,2].sample }
    # dob "2015-06-10"
    sequence(:address) { |n| "#{n} Little Patuxent Parkway" }
    city "Columbia"
    state "Maryland"
    country "US"
  end
end
