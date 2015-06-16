class Project < ActiveRecord::Base
  validates :name, presence: true
  validates :user_id, presence: true

  has_many :projects_children
  has_many :children, through: :projects_children
end
