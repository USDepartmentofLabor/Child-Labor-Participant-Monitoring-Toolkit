module CustomFieldsHelper
  def custom_field_value(custom_field, model_id)
    if custom_field.respond_to?(:custom_value_text) &&
      custom_field.custom_value_text(model_id).present?
      return custom_field.custom_value_text(model_id)
    end
    return nil
  end

  def custom_field_other(custom_field, model_id)
    if custom_field.respond_to?(:custom_value_other) &&
      custom_field.custom_value_other(model_id).present?
      return custom_field.custom_value_other(model_id)
    end
    return nil
  end

  def custom_input(field_object, name, model_id, options={})
    field_type = field_object.field_type

    if options[:fill].nil? || options[:fill]
      content = custom_field_value(field_object, model_id)
      other = custom_field_other(field_object, model_id)
    else
      content = nil
      other = nil
    end

    case field_type
    when "text"
      text_field_tag(name, content, {class: "form-control"}.merge(options))

    when "textarea"
      text_area_tag(name, content,
                    {class: "form-control", rows: 5}.merge(options))

    when "select"
      options_dom =
        field_object.selections.to_s.split(CustomFieldGroup.option_delimiter)
      # content should be the options for select in this case
      select_tag(name, options_for_select(options_dom, content),
                 {class: "form-control", include_blank: true}.merge(options))

    when "check_box"
      options_dom =
        field_object.selections.to_s.split(CustomFieldGroup.option_delimiter)
      checkbox_dom = options_dom.map.with_index do |opt, i|
        checked = content && content.include?(opt)
        content_tag(:div, class: "checkbox") do
          checks = content_tag(:label, class: "checkbox-inline") do
            concat check_box_tag("#{name}[]", opt, checked,
                                 {id: "#{name.gsub(/\[|\]/, '_')}_#{i}",
                                  class: "square-red"}.merge(options))
            concat " #{opt}"
          end

          if opt.include? "(specify)"
            checks +=
              text_field_tag(name.sub('value_text', 'other'), other,
                             {class: "form-control with-check"}.merge(options)
                            )
          end
          checks
        end
      end
      checkbox_dom.join.html_safe

    when "radio_button"
      options_dom =
        field_object.selections.to_s.split(CustomFieldGroup.option_delimiter)
      radio_dom = options_dom.map.with_index do |opt, i|
        checked = (opt == content)
        content_tag(:div, class: "radio") do
          radios = content_tag(:label, class: "radio-inline") do
            concat radio_button_tag(name, opt, checked,
                                    {class: "square-red"}.merge(options))
            concat " #{opt}"
          end

          if opt.include? "(specify)"
            radios +=
              text_field_tag(name.sub('value_text', 'other'), other,
                             {class: "form-control with-radio"}.merge(options)
                            )
          end
          radios
        end
      end
      radio_dom.join.html_safe

    when "number"
      number_field_tag(name, content, {class: "form-control"}.merge(options))

    when "date"
      content_tag(:div, class: "row date-select") do
        date_select(name, content,
                    {start_year: 1901, end_year: 2099, include_blank: true},
                    {class: "form-control"}.merge(options))
      end

    when "rank_list"
      options_dom =
        field_object.selections.split(CustomFieldGroup.option_delimiter)
      grid_dom = options_dom.map.with_index do |opt, i|
        checked = (opt == content)
        content_tag(:div, class: "grid-rank checkbox") do
          content_tag(:span, class: "grid-option") do
            s = content_tag(:span, class: "checkbox-inline grid-value",
                            data: {option: i}) do
              "#"
            end

            q = content_tag(:label, class: "checkbox-inline grid-question") do
              concat check_box_tag(name, opt, checked,
                                   {class: "square-red grid-check",
                                    name: name + '[]',
                                    id: "#{name.gsub(/\[|\]/, '_')}_#{i}",
                                    data: {option: i}}.merge(options)
                                  )
              concat " #{opt}"
            end

            o = nil

            if opt.include? "(specify)"
              o = 
                text_field_tag(name.sub('value_text', 'other'), other,
                             {class: "form-control with-check"}.merge(options)
                              )
            end

            [s, q, o].join.html_safe
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
