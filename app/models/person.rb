class Person < ActiveRecord::Base
  SEX_OPTIONS = [ ["select_options.adult.male", 1], ["select_options.adult.female", 2] ]

  belongs_to :household

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
end
