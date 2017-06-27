class EducationStatus < ActiveRecord::Base
  validates :name, uniqueness: { case_sensitive: false }
  has_many :follow_ups
end
