module ChildrenHelper
  def format_date_range(status)
    str = ""
    str += status.start_date.to_s

    if status.end_date.present?
      str = str.empty? ? status.end_date.to_s : "#{str} &ndash; #{status.end_date}".html_safe
    end

    str
  end

  def household_options
    options = options_from_collection_for_select(Household.all.order("id DESC"), "id", "name")
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

  def show_services_for(child)
    child.service_instances.count > 0
  end

  def show_statuses_for(child)
    child.statuses.count > 0
  end

  def edit_status_for(child, status)
    if status
      render partial: 'status_edit_link', locals: {child: child, status: status}
    end
  end
end
