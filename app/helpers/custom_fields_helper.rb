module CustomFieldsHelper
  def custom_field_value(custom_field)
    if custom_field.respond_to?(:custom_value_text) && custom_field.custom_value_text.present?
      return custom_field.custom_value_text
    end
    return nil
  end

  def custom_input(field_object, name, options={})
    field_type = field_object.field_type

    if options[:fill].nil? || options[:fill]
      # content = field_object.custom_value.present? ? field_object.custom_value.value_text : nil
      content = custom_field_value(field_object)
    else
      content = nil
    end

    case field_type
    when "text"
      text_field_tag(name, content, {class: "form-control"}.merge(options))

    when "textarea"
      text_area_tag(name, content, {class: "form-control", rows: 5}.merge(options))

    when "select"
      options_dom = field_object.selections.to_s.split(CustomFieldGroup.option_delimiter)
      # content should be the options for select in this case
      select_tag(name, options_for_select(options_dom, content), {class: "form-control", include_blank: true}.merge(options))

    when "check_box"
      options_for_select = field_object.selections.to_s.split(CustomFieldGroup.option_delimiter)
      checkbox_dom = options_for_select.map.with_index do |opt, i|
        checked = (opt == content)
        content_tag(:div, class: "checkbox") do
          content_tag(:label, class: "radio-inline") do
            concat check_box_tag(name, opt, checked, {class: "square-red"}.merge(options))
            concat " #{opt}"
          end
        end
      end
      checkbox_dom.join.html_safe

    when "radio_button"
      options_for_select = field_object.selections.to_s.split(CustomFieldGroup.option_delimiter)
      radio_dom = options_for_select.map.with_index do |opt, i|
        checked = (opt == content) # content.blank? ? (i == 0) : (opt == content)
        content_tag(:div, class: "radio-inline") do
          content_tag(:label, class: "radio-inline") do
            concat radio_button_tag(name, opt, checked, {class: "square-red"}.merge(options))
            concat " #{opt}"
          end
        end
      end
      radio_dom.join.html_safe

    when "number"
      number_field_tag(name, content, {class: "form-control"}.merge(options))
    else
      nil
    end
  end
end
