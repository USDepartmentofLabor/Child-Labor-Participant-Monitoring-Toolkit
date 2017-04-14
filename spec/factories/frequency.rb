FactoryGirl.define do
	factory :frequency do
		sequence(:name) { |n|"Reporting frequency #{n}" }
  end
end
