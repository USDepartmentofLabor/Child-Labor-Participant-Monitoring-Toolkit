class WorkStatus < ActiveRecord::Base
  validates :name, uniqueness: { case_sensitive: false }
end
