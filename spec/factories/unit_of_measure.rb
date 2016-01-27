FactoryGirl.define do
	factory :unit_of_measure do
		sequence(:name) { |n|"Test unit of measure #{n}" }

    #sequence(:name){|n| "Project #{n}"}
  end
end
