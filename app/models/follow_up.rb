class FollowUp < ActiveRecord::Base
    belongs_to :person
    belongs_to :occupation
    belongs_to :work_status
    belongs_to :education_status
end
