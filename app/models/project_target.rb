class ProjectTarget < ActiveRecord::Base
  belongs_to :project
  belongs_to :project_target_type
end
