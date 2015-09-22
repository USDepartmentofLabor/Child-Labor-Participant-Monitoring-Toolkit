class EducationIndicator
	# Education Indicator (E1) Generator
	# start_date and end_date should be a Date Object
	# should provide ids at the first place.
	#  work_types = ["Engaged in Child Labor", "High-Risk of Entering Child Labor"]
	#  service_types = ["Formal Education", "Non-formal Education", "Vocational Education"]
	#  work_status_id = WorkStatus.where(name: work_types).pluck(:id)
	#  education_status_ids = EducationStatus.where(name: service_types).pluck(:id)
	def initialize(education_status_ids, start_date, end_date, project_id)
	  @start_date = start_date
	  @end_date = end_date
	  @project_id = project_id
	  @education_status_ids = education_status_ids
	  @educated_children_ids = children_provided_education
	end

	def generate(work_status_id)
		target_children_ids = children_with_work(work_status_id)
		target_children_educated = target_children_ids & @educated_children_ids

		total_children = target_children_ids.length
		total_children_educated = target_children_educated.length

		children_male = children_with_gender(target_children_educated, :male)
		children_female = children_with_gender(target_children_educated, :female)

		results = {
			target_total: total_children,
			educated: {
				girls: children_female.length,
				boys: children_male.length,
				total: total_children_educated
			}
		}

		return results
	end

	# Return unique IDs of children, whose working status is work_status_id, within given period of time.
	def children_with_work(work_status_id)
		child_ids = ChildStatus.where(
			project_id: @project_id,
			work_status_id: work_status_id,
			start_date: (@start_date..@end_date)
		).pluck("DISTINCT child_id")

		child_ids
	end

	# Return unique IDs of children, to whom education services are provided, within given period of time.
	def children_provided_education
		child_ids = ChildStatus.where(
			project_id: @project_id,
			education_status_id: @education_status_ids, 
			start_date: (@start_date..@end_date)
		).pluck("DISTINCT child_id")

		child_ids
	end

	def children_with_gender(child_ids, gender)
		child_ids = Child.where(id: child_ids).send(gender).pluck(:id)
		child_ids
	end
end