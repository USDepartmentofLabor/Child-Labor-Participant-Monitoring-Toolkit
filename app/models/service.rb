class Service < ActiveRecord::Base
  has_many :service_instances
  has_and_belongs_to_many :children
  belongs_to :service_type
  belongs_to :project

  validates :name, :service_type_id, :start_date, :end_date, presence: true

  validate :start_date_and_end_date_must_exist_in_project_time, :if => "start_date && end_date"

  validate :start_date_before_end_date, :if => "start_date && end_date"

  def start_date_and_end_date_must_exist_in_project_time
    project = Project.find(project_id)
    if project.start_date && start_date < project.start_date
      errors.add(:start_date, "can't be before project start date")
    elsif project.end_date && start_date > project.end_date
      errors.add(:start_date, "can't be after project end date")
    end

    if project.start_date && end_date < project.start_date
      errors.add(:end_date, "can't be before project start date")
    elsif project.end_date && end_date > project.end_date
      errors.add(:end_date, "can't be after project end date")
    end
  end

  def start_date_before_end_date
    if start_date > end_date
      errors.add(:start_date, "must be before end date")
    end
  end
end
