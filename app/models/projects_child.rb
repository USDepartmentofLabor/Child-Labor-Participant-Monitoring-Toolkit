class ProjectsChild < ActiveRecord::Base
  belongs_to :project
  belongs_to :child
end
