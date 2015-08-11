class CustomFieldForm
  FIELD_TYPES_OPTIONS = {
    "Short Text" => "text",
    "Long Text" => "textarea",
    "Check Box" => "check_box",
    "Radio Button" => "radio_button",
    "Selection Field" => "select",
    "Numeric Field" => "number"
  }

  def self.option_delimiter
    "\r\n"
  end

  def self.create(target, fields, values)

    fields.each do |field|
      next if values[field.id.to_s].blank? || values[field.id.to_s].blank?
      custom_value = CustomValue.new
      custom_value.value_text = values[field.id.to_s]["value_text"]
      custom_value.custom_field_id = field.id
      custom_value.model_id = target.id
      custom_value.save
    end
  end
end