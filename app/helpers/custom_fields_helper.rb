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
            concat check_box_tag("#{name}[]", opt, checked, {id: "#{name.gsub(/\[|\]/, '_')}_#{i}", class: "square-red"}.merge(options))
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

    when "date"
      date_field_tag(name, content, {class: "form-control"}.merge(options))

    when "rank_list"
      options_for_list = field_object.selections.split(CustomFieldGroup.option_delimiter)
      grid_dom = options_for_list.map.with_index do |o, i|
        checked = (o == content)
        content_tag(:div, class: "form-group grid-option") do
          content_tag(:span, class: "grid-rank") do
            s = content_tag(:span, class: "checkbox-inline grid-value", data: {option: i}) do
              "#"
            end
            q = content_tag(:label, class: "checkbox-inline grid-question") do
              concat check_box_tag(name, o, checked,
                {class: "square-red grid-check", data: {option: i}}.merge(options))
              concat " #{o}"
            end

            [s, q].join.html_safe

          end
        end
      end
      grid_dom.join.html_safe

    when "hidden"
      hidden_field_tag(name, content)

    else
      nil

    end
  end
end
