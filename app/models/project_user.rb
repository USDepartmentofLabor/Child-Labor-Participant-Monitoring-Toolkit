class ProjectUser < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

#  serialize :role_ids

  scope :by_project, lambda{|p| where(:project_id => p.id)}

  def roles
    Role.where(:id => self.role_ids)
  end

  def role_ids=(role_ids)
    self.role_ids = role_ids
  end

  def has_role(role)
  end
end
