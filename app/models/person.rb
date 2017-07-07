class Person < ActiveRecord::Base
  SEX_OPTIONS = [ ["select_options.adult.male", 1], ["select_options.adult.female", 2] ]

  belongs_to :household
  belongs_to :relationship
  has_many :follow_ups
  has_and_belongs_to_many :work_activities

  has_many :statuses, class_name: "ChildStatus", dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :sex, presence: true, inclusion: { in: [1, 2] }

  scope :who_are_adults, -> {
    where('age > ? OR dob < ?', 17, Date.today - 17.years)
  }

  scope :who_are_children, -> {
    where('age <= ? OR dob >= ?', 17, Date.today - 17.years)
  }

  scope :male, -> { where(sex: 1) }
  scope :female, -> { where(sex: 2) }
  scope :by_last_name, -> { order(:lname, :fname, :mname) }
  scope :by_first_name, -> { order(:fname, :mname, :lname) }

  def full_name
    middle_name ? "#{first_name} #{middle_name} #{last_name}" : "#{first_name} #{last_name}"
  end

  def self.gender_name(i)
    return nil if i.nil? || i <= 0
    option = SEX_OPTIONS[i - 1]
    return I18n.t(option[0])
  end

  def gender_name
    Person.gender_name(self.sex)
  end

  def relationship_name
    if relationship
      if relationship.canonical_name == 'OTHER'
        return relationship_other
      end

      return relationship.display_name
    end
  end

  def intake_work_status
    if age >= 5 and age <= 17
      if work_activities.any? || have_job_returning_to
        if occupation_id.present? || industry_id.present? ||
           exposed_to_hazardous_condition || subject_to_abuses
          return WorkStatus.find(2)
        elsif (age >= 5 && age <= 14) && (!hours_worked.nil? && hours_worked > 14)
          return WorkStatus.find(1)
        elsif age <= 17 and (!hours_worked.nil? && hours_worked > 40)
          return WorkStatus.find(1)
        end
      end
    end
  else
    return nil
  end

  def intake_education_status
    if enrolled_in_school
      return EducationStatus.find(1)
    else
      return nil
    end
  end
end
