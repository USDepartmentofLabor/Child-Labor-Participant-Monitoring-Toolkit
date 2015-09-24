class EducationIndicator
	# Education Indicator (E1) Generator
	# 
	# Use #generate method to get the results
	# The results follows the latest Annex A - Common Indicators_Final.xlsx Excel file
	def initialize(education_status_ids, start_date, end_date, project_id)
	  @start_date = start_date
	  @end_date = end_date
	  @project_id = project_id
	  @education_status_ids = education_status_ids
	  @educated_children_ids = children_provided_education
	end

	def generate
		cl_ids = children_with_work("CL")
		# if a child has both CL and CAHR status in record, 
		# then only CL is counted. (count once requiremnt)
		cahr_ids = children_with_work("CAHR") - cl_ids


		cl_educated = cl_ids & @educated_children_ids
		cahr_educated = cahr_ids & @educated_children_ids

		cl_educated_male = children_with_gender(cl_educated, :male)
		cl_educated_female = children_with_gender(cl_educated, :female)

		cahr_educated_male = children_with_gender(cahr_educated, :male)
		cahr_educated_female = children_with_gender(cahr_educated, :female)

		results = {
			target: {
				cl: cl_ids.length,
				cahr: cahr_ids.length,
				total: cl_ids.length + cahr_ids.length
			},
			educated: {
				cl: {
					girls: cl_educated_female.length,
					boys: cl_educated_male.length,
					total_children: cl_educated.length
				},
				cahr: {
					girls: cahr_educated_female.length,
					boys: cahr_educated_male.length,
					total_children: cahr_educated.length
				},
				total: {
					girls: cl_educated_female.length + cahr_educated_female.length,
					boys: cl_educated_male.length + cahr_educated_male.length,
					total_children: cl_educated.length + cahr_educated.length
				}
			}
		}

		return results
	end

	# Return unique IDs of children, whose has work status equal to @work_type param, within given period of time.
	# work_type options:
	# "CL": Children Engaged in Child Labor
  # "CAHR": Children at High-Risk of Entering Child Labor
	def children_with_work(work_type)
		work_status_id = WorkStatus.where(work_type: work_type).pluck(:id)
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