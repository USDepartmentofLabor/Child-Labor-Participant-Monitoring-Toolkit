class Child < ActiveRecord::Base
  # sex/gender i18n string with integer value pair
  # Integer value follows ISO standards: http://en.wikipedia.org/wiki/ISO/IEC_5218
  SEX_OPTIONS = [ ["select_options.child.male", 1], ["select_options.child.female", 2] ]

  scope :male, -> { where(sex: 1) }
  scope :female, -> { where(sex: 2) }

  validates :fname, presence: true
  validates :lname, presence: true
  validates :country, length: {maximum: 2}
  validates :sex, presence: true, inclusion: { in: [1,2] }

  has_many :statuses, class_name: "ChildStatus", dependent: :destroy

  has_many :projects_children, dependent: :destroy
  has_many :projects, through: :projects_children

  belongs_to :household

  mount_uploader :avatar, AvatarUploader

  # Input: the integer of sex field
  # Return: the human readable text of the sex name 
  def self.gender_name(i)
    return nil if i.nil? || i <= 0
    option = SEX_OPTIONS[i - 1]
    return I18n.t(option[0])
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

  def full_name
    mname ? "#{fname} #{mname} #{lname}" : "#{fname} #{lname}"
  end
end
