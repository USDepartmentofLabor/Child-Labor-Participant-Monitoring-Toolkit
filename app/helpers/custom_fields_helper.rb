module CustomFieldsHelper
  def custom_field_value(custom_field, model_id)
    custom_field.model_id = model_id
    if custom_field.value.present?
      return custom_field.value['value'] || custom_field.value['value_text']
    end
    nil
  end

  def custom_field_other(custom_field, model_id)
    custom_field.model_id = model_id
    if custom_field.value.present?
      return custom_field.value['other']
    end
    nil
  end

  def custom_field_order(custom_field, model_id)
    custom_field.model_id = model_id
    if custom_field.value.present? && custom_field.value['order'] && custom_field.value['order'] != ''
      return custom_field.value['order']
    end

    return nil
  end

  def display_data_custom_field(date_as_json)
    if date_as_json and date_as_json.length > 0
      y = date_as_json["(1i)"].to_i
      m = date_as_json["(2i)"].to_i
      d = date_as_json["(3i)"].to_i
      begin
        Date.new(y, m, d)
      rescue
        nil
      end
    end
  end

  def custom_field_display(custom_field, model_id)
    value = ''
    custom_field_type = custom_field.field_type
    if custom_field_type == 'date'
      display_data_custom_field(custom_field_value(custom_field, model_id))
    elsif custom_field_type == 'rank_list'
      rank_list_display(custom_field, model_id)
    elsif custom_field_value(custom_field, model_id).is_a? Array
      value = custom_field_value(custom_field, model_id).join(', ')
    else
      value = custom_field_value(custom_field, model_id)
    end

    #if custom_field_value(custom_field, model_id).is_a? Array
    #  return value = custom_field_value(custom_field, model_id).join(', ')
    #else
    #  return value = custom_field_value(custom_field, model_id)
    #end
    #return value + ' ' + custom_field_other(custom_field, model_id)
  end

  def custom_input(field_object, name, model_id, options={})
    field_type = field_object.field_type

    if options[:fill].nil? || options[:fill]
      content = custom_field_value(field_object, model_id)
      other = custom_field_other(field_object, model_id)
      order = custom_field_order(field_object, model_id)
    else
      content = nil
      other = nil
      order = nil
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
      date_options = {start_year: 1901, end_year: 2099, include_blank: true}
      content_tag(:div, class: "row date-select") do
        
        if(content)
          y = content["(1i)"].to_i
          m = content["(2i)"].to_i
          d = content["(3i)"].to_i

          if m == 0 || d == 0
            date_select(name, nil, date_options,
                        {class: "form-control"}.merge(options))
          else
            select_date(Date.new(y, m, d), date_options,
                        {class: "form-control"}.merge(options))
          end
        else
          date_select(name, nil, date_options,
                      {class: "form-control"}.merge(options))
        end
      end

    when "rank_list"
      options_dom =
        field_object.selections.split(CustomFieldGroup.option_delimiter)
      grid_dom = options_dom.map.with_index do |opt, i|
        checked = content && content.include?(opt)
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

      r = hidden_field_tag(name.sub('value_text', 'order'), order,
                           {class: "grid-order"}.merge(options))

      [grid_dom, r].join.html_safe

    when "hidden"
      hidden_field_tag(name, content)

    else
      nil

    end
  end

  def rank_list_display(field_object, model_id)
    content = custom_field_value(field_object, model_id)
    other = custom_field_other(field_object, model_id)
    order = custom_field_order(field_object, model_id)

    if content.nil? || content == ''
      content = []
    end

    if order.nil? || order == ''
      order = []
    else
      order = JSON.parse(order)
    end

    i = content.find_index{|s| s.include? '(specify)'}

    if !i.nil?
      content[i].gsub!(/ \(specify\)/, ": #{other}")
    end

    content_tag(:ol) do
      content.each do |x|
        concat content_tag(:li, x)
      end
    end
  end
end
