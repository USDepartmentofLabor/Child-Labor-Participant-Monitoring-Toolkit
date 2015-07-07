class ProjectsHousehold < ActiveRecord::Base
  belongs_to :project
  belongs_to :household
end
