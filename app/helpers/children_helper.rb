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

  def preview_avatar(child)
    if child.avatar.present?
      return image_tag(child.avatar_url(:small))      
    end
    
    if child.female?
      return image_tag("default_avatar_female.jpg")
    end

    return image_tag("default_avatar_male.jpg")
  end
end
