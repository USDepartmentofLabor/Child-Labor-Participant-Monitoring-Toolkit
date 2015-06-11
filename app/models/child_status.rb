class ChildStatus < ActiveRecord::Base
	belongs_to :child
	belongs_to :work_status
	belongs_to :education_status
end
