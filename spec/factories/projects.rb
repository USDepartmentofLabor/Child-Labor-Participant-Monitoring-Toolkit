FactoryGirl.define do
  factory :project do
    sequence(:name){|n| "Project #{n}"}

    country "US"

    factory :project_with_children do
      transient do
        num_child 3
      end

      after(:create) do |project, evaluator|
        children = create_list(:child, evaluator.num_child)
        children.each do |child|
          project.children << child
        end
      end
    end
  end
end
