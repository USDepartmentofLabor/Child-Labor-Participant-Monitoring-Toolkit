module ChildrenHelper
	def format_date_range(status)
		str = ""
		str += status.start_date.to_s

		if status.end_date.present?
			str = str.empty? ? status.end_date.to_s : "#{str} - #{status.end_date}"
		end
		str
	end

  def household_options
    options = options_from_collection_for_select(Household.all, "id", "name")
    options += "<option value='0'>#{t('children.new.create_household')}</option>".html_safe
    options
  end

  # options support all the options for image_tag
  # Addtional options:
  #   options[:size] : default is :small, if :full then will use full size
  def preview_avatar(child, options={})
    size = options.delete(:size)

    size = (size == :full ? nil : :small)

    if child.avatar.present?

      return image_tag(child.avatar_url(size), options)
    end

    if child.female?
      return image_tag("default_avatar_female.jpg", options)
    end

    return image_tag("default_avatar_male.jpg", options)
  end

	def link_to_add_conditions(name, f, type)
    new_object = f.object.send "build_#{type}"
    id = "new_#{type}"
    fields = f.send("#{type}_fields", new_object, child_index: id) do |builder|
      render(type.to_s + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def custom_input(field_object, name, options={})
    field_type = field_object.field_type
    content = nil
    case field_type
    when "text"
      text_field_tag(name, content, {class: "form-control"}.merge(options))

    when "textarea"
      text_area_tag(name, content, {class: "form-control", rows: 5}.merge(options))

    when "select"
      options_for_select = field_object.selections.to_s.split(CustomFieldForm.option_delimiter)
      # content should be the options for select in this case
      select_tag(name, options_for_select, {class: "form-control"}.merge(options))

    when "checkbox"
      options_for_select = field_object.selections.to_s.split(CustomFieldForm.option_delimiter)
      
      checkbox_div = options_for_select.map.with_index do |opt, i|
        content_tag(:div, class: "checkbox") do
          content_tag(:label, class: "radio-inline") do
            concat check_box_tag(name, opt, i == 0, {class: "square-red"}.merge(options))
            concat " #{opt}"
          end
        end
      end
      checkbox_div.join.html_safe

    when "radio_button"
      options_for_select = field_object.selections.to_s.split(CustomFieldForm.option_delimiter)
      
      radio_div = options_for_select.map.with_index do |opt, i|
        content_tag(:div, class: "radio") do
          content_tag(:label, class: "radio-inline") do
            concat radio_button_tag(name, opt, i == 0, {class: "square-red"}.merge(options))
            concat " #{opt}"
          end
        end
      end
      radio_div.join.html_safe
      
    when "number"
      number_field_tag(name, content, {class: "form-control"}.merge(options))
    else
      nil
    end 
  end
end
