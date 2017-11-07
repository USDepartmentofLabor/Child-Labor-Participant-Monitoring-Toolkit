FactoryBot.define do
  factory :custom_value do
    custom_field_id 1
    model_id 1
    value_text({value: "Text"}.to_json)
  end
end
