class CustomFieldGroup
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
      custom_value.value_text = values[field.id.to_s]["value_text"].strip
      custom_value.custom_field_id = field.id
      custom_value.model_id = target.id
      custom_value.save
    end
  end

  def self.update(target, fields, values)
    # ids = values.keys
    field_ids = fields.map(&:id)
    # CustomValue.where(id: ids, custom_field_id: field_ids).each do |custom_value|

    CustomValue.where(model_id: target.id, custom_field_id: field_ids).each do |custom_value|

      next if values[custom_value.custom_field_id.to_s].blank?

      input_value = values[custom_value.custom_field_id.to_s]["value_text"].to_s

      next if custom_value.value_text.to_s == input_value

      custom_value.update(value_text: input_value.strip)
    end
  end
end