module ChildrenHelper
	def format_date_range(status)
		str = ""
		str += status.start_date.to_s

		if status.end_date.present?
			str = str.empty? ? status.end_date.to_s : "#{str} - #{status.end_date}"
		end
		str
	end
end
