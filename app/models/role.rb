class Role < ActiveRecord::Base
  scope :by_project, lambda {|p| where(:project_id => p.id)}
end
