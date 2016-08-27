FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user-#{n}@fake-mail.com" }
    password "password"
    sequence(:name) {|n| "user-#{n}" }
  end

end
