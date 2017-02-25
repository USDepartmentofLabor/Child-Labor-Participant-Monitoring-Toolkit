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

  def self.create(target, fields, values)
    fields.each do |field|
      next if values[field.id.to_s].blank? || values[field.id.to_s]["value_text"].blank?
      custom_value = CustomValue.new
      custom_value.value_text = values[field.id.to_s]["value_text"].strip
      custom_value.custom_field_id = field.id
      custom_value.model_id = target.id
      custom_value.save
    end
  end

  def self.create_or_update(target, fields, values)
    fields.each do |field|
      next if values[field.id.to_s].nil? || (!values[field.id.to_s].is_a? Array && values[field.id.to_s]["value_text"].nil?)

      custom_value = CustomValue.where(model_id: target.id, custom_field_id: field.id).first_or_initialize

      if values[field.id.to_s]["value_text"].is_a? Array
        custom_value.value_text = values[field.id.to_s]["value_text"].join(option_delimiter)
      else
        custom_value.value_text = values[field.id.to_s]["value_text"].strip
      end
      custom_value.save
    end
  end

  def self.update(target, fields, values)
    field_ids = fields.map(&:id)

    CustomValue.where(model_id: target.id, custom_field_id: field_ids).each do |custom_value|
      value = value[custom_value.custom_field_id.to_s]

      next if value.blank?

      if value["value_text"].is_a? Array
        input_value = value["value_text"].join(option_delimiter)
      else
        input_value = value["value_text"].strip
      end

      next if custom_value.value_text.strip == input_value

      custom_value.update(value_text: input_value)
    end
  end
end
