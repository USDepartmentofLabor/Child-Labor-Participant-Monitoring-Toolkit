FactoryGirl.define do
  factory :custom_field do
    sequence(:name) {|n| "custom-field-#{n}"}
    field_type { CustomFieldGroup::FIELD_TYPES_OPTIONS[CustomFieldGroup::FIELD_TYPES_OPTIONS.keys.sample] }
    selections "a\r\nb\r\nc\r\nd"
    validation_rules nil
    project_id 1
    model_type nil
  end
end
