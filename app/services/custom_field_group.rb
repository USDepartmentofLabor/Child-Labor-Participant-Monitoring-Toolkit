class CustomFieldGroup
  FIELD_TYPES_OPTIONS = {
    "Short Text" => "text",
    "Long Text" => "textarea",
    "Check Box" => "check_box",
    "Radio Button" => "radio_button",
    "Selection Field" => "select",
    "Numeric Field" => "number",
    "Date Field" => "date",
    "Rank List" => "rank_list"
  }

  def self.option_delimiter
    "\r\n"
  end

  def self.create_or_update(target, fields, values)
    fields.each do |field|
      field_id = field.id.to_s
      custom_value = CustomValue.where(model_id: target.id, custom_field_id: field.id).first_or_initialize

      custom_value.value_text = values[field_id].to_json

      if !(custom_value.value_text.blank? || values[field_id].nil?)
        custom_value.save
      end
    end
  end

end
