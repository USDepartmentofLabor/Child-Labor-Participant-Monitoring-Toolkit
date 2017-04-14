class Child < Person
  # sex/gender i18n string with integer value pair
  # Integer value follows ISO standards: http://en.wikipedia.org/wiki/ISO/IEC_5218
  SEX_OPTIONS = [ ["select_options.child.male", 1], ["select_options.child.female", 2] ]

  has_many :statuses, class_name: "ChildStatus", dependent: :destroy

  has_many :service_instances

  has_many :services, through: :child_service

  belongs_to :household

#  mount_uploader :avatar, AvatarUploader

  accepts_nested_attributes_for :statuses,
    :allow_destroy => true,
    :reject_if     => :all_blank

  default_scope { where('(age <= 17 or dob >= ?)', Date.today - 17.years) }
  scope :who_are_beneficiaries, -> { where('is_beneficiary', true) }

  # Input: the integer of sex field
  # Return: the human readable text of the sex name
  def self.gender_name(i)
    return nil if i.nil? || i <= 0
    option = SEX_OPTIONS[i - 1]
    return I18n.t(option[0])
  end

  def self.gender_names
    [I18n.t(SEX_OPTIONS[0][0]), I18n.t(SEX_OPTIONS[1][0])]
  end

  def self.group_by_age
    date_range_e = (Date.today - 17.years)..(Date.today - 14.years) # 0..4
    date_range_d = (Date.today - 14.years)..(Date.today - 10.years) # 5..8
    date_range_c = (Date.today - 10.years)..(Date.today - 7.years) # 9..11
    date_range_b = (Date.today - 7.years)..(Date.today - 4.years) # 12..14
    date_range_a = (Date.today - 4.years)..(Date.today - 0.years) # 15..17
    c = Person.arel_table

    group_a = Person.where(c[:age].between(0..4)
                .or(c[:dob].between(date_range_a))).count
    group_b = Person.where(c[:age].between(5..8)
                .or(c[:dob].between(date_range_b))).count
    group_c = Person.where(c[:age].between(9..11)
                .or(c[:dob].between(date_range_c))).count
    group_d = Person.where(c[:age].between(12..14)
                .or(c[:dob].between(date_range_d))).count
    group_e = Person.where(c[:age].between(15..17)
                .or(c[:dob].between(date_range_e))).count

    [group_a, group_b, group_c, group_d, group_e]   
  end

  def male?
    self.sex == 1
  end

  def female?
    self.sex == 2
  end

  def country_name
    return nil if country.nil?
    country_iso = ISO3166::Country[country]
    country_iso.translations[I18n.locale.to_s] || country_iso.name
  end

  def gender_name
    Child.gender_name(self.sex)
  end

  def current_education_status
    status = statuses.latest_education
    if status.is_a? ChildStatus
      status.name = status.education_status.name
    else
      return nil
    end

    status
  end

  def current_work_status
    status = statuses.latest_work
    if status.is_a? ChildStatus
      status.name = status.work_status.name
    else
      return nil
    end

    status
  end
end
