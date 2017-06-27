class Person < ActiveRecord::Base
  SEX_OPTIONS = [ ["select_options.adult.male", 1], ["select_options.adult.female", 2] ]

  belongs_to :household
  belongs_to :relationship
  has_many :follow_ups
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

  def intake_status
    #statuses = ChildStatus.find_by(child_id: id)
    #if !statuses.nil?
    #  return statuses.order(:created_at).first
    #end
    #child_statuses.order(:created_at).first
    ChildStatus.where("child_id = #{id}").order(:created_at).first
  end
end
