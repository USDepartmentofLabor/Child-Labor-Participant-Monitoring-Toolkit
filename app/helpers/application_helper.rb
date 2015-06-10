module ApplicationHelper
	def format_time(time)
		time.strftime("%Y-%m-%d at %I:%M %p")
	end
end
