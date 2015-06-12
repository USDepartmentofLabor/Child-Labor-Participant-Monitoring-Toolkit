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
end
