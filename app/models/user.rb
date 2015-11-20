class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  has_many :project_users

  has_many :projects, through: :project_users

  def role_ids(project)
    roles = self.project_users.by_project(project).map(&:role_ids).flatten
  end

  def role_ids=(role_ids)
    self.project_user.role_ids = role_ids
  end

  def project_roles(project)
    roles = self.role_ids(project)
    Role.where(:id => roles)
  end
end
