FactoryGirl.define do
	factory :frequency, :aliases => [:reporting_frequency] do
		sequence(:name) { |n|"Reporting frequency #{n}" }
  end
end
