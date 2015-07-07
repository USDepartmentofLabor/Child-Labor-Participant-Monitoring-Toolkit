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
end
