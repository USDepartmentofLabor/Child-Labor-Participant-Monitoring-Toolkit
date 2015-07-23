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
end
