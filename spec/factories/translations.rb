FactoryGirl.define do
  factory :translation do
    locale "MyString"
    key "MyString"
    value "MyText"
    interpolations ["MyText"]
    is_proc false
  end
end
