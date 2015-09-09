module ApplicationHelper
	def format_time(time)
		time.strftime("%Y-%m-%d at %I:%M %p")
	end

	def error_messages(resource)
    return "" if resource.errors.empty?
    warn_sign = "<i class=\"fa fa-exclamation-circle\"></i>"
    messages = resource.errors.full_messages.map { |msg| "<li>" + warn_sign + msg + "</li>" }.join
    # sentence = I18n.t("errors.messages.not_saved",
    #                   count: resource.errors.count,
    #                   resource: resource.class.model_name.human.downcase)

    html = <<-HTML
    <div class="error_explanation">
      <ul class="text-danger list-unstyled">
        #{messages}
      </ul>
    </div>
    HTML

    html.html_safe
  end

  def link_to_add_fields(name, f, association, options={})
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    parent_name = f.object.class.to_s.downcase.pluralize
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render( "#{parent_name}/" + association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: (options[:class] || "add_fields"), data: {id: id, fields: fields.gsub("\n", "")})
  end

  def country_name_in_text(country_code)
    return nil if country_code.nil?
    country_iso = ISO3166::Country[country_code]
    country_iso.translations[I18n.locale.to_s] || country_iso.name
  end

  def group_state_options(project_regions)
    grouped_options = {}
    project_regions.each do |region|
      country = country_name_in_text(region.country)
      if grouped_options.has_key?(country)
        grouped_options[country] << region.state
      else
        grouped_options[country] = [region.state]
      end
    end
    grouped_options_for_select(grouped_options)
  end
end
