class WorkStatus < ActiveRecord::Base
  validates :name, uniqueness: { case_sensitive: false }
  has_many :child_statuses
  has_many :follow_ups
end
