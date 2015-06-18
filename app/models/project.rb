class Project < ActiveRecord::Base
  validates :name, presence: true
  validates :user_id, presence: true

  has_many :projects_children, dependent: :destroy
  has_many :children, through: :projects_children

  has_many :projects_households, dependent: :destroy
  has_many :households, through: :projects_households

  has_many :reports
end
